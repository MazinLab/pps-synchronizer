module pps_synch(
	input		clk,
	// 1PPS input signal (Internally delayed by one clock cycle)
	input	[2:0]	pps,
	// Allows us to select one or several PPS inputs to be ord together
	input	[2:0]	pps_sel,
	// Sysref input signal (Internally delayed by one clock cycle)
	input		sysref,
	// Seconds counter value to load on the next start
	input	[31:0]	load_secs,
	// Nanosecond counter value to load on the next start
	input	[31:0]	load_ns,
	// The subns counter field is fractional ns such that 1ns is 2^8 subns
	input	[7:0]	load_subns,
	// Number of ns in a clock period
	input	[5:0]	ns_per_clk,
	// Number of subns in a clock period
	input	[7:0]	subns_per_clk,
	// Delays the PPS edge by some number of ns
	input	[31:0]	delay_ns,
	// mode:
	// 	0 - Stopped
	// 	1 - Force Start, Does whats on the tin
	// 	2 - Free running, starts on next PPS edge
	// 	3 - PPS Sync, reset ns and increment secs on PPS edge, starts
	// 	    on next PPS edge
	// 	4 - SYSREF synced, all the functionality of PPS sync but waits
	// 	    for a SYSREF rising edge before starting
	// 	5 - SYSREF freerun, Starts on next SYSREF edge 
	//
	// 	Other settings are reserved for future use
	// 	
	// 	Free running modes will slip from real time if ns_per_clk does
	// 	not evenly devide the number of ns in a second
	input	[3:0]	mode,
	// sanity_mode:
	// 	0 - No sanity checking on PPS triggered rollover
	// 	1 - Locks out rollover for some debounce interval
	// 	2 - Rolls over without PPS when ns counter hits some threshold
	// 	3 - Both of the above
	// 	4-6 reserved
	// 	7 - Same as 3 but resyncs cleanly when PPS is recovered
	input	[2:0]	sanity_mode,
	// Lockout debounce inteval
	input	[15:0]	lockout_ns,
	// Threshold after which we count up without PPS
	input	[31:0]	rollover_thresh_ns,
	// Emergency 
	// capture_mode:
	// 	0 - Clear Capture
	// 	1 - Capture on next PPS edge
	// 	2 - Capture on next SYSREF edge,
	// 	3 - Reserved
	input	[1:0]	capture_mode,
	// Captured secs timer value
	output	[31:0]	captured_secs,
	// Captured ns timer value
	output	[31:0]	captured_ns,
	// Captured subns timer value
	output	[7:0]	captured_subns,
	// Indicates a completed capture
	output		captured,
	// Seconds counter output
	output	[31:0]	secs,
	// Nanoseconds counter output
	output	[31:0]	ns,
	// Sub Nanosecond counter output
	output	[7:0]	subns,
	// Indicates that the timer is running
	output		running
);

	reg	   started;
	reg [3:0]  mode_r;
	reg [1:0]  capture_mode_r;
	reg [2:0]  sanity_mode_r;
	reg [5:0]  ns_per_clk_r;
	reg [7:0]  subns_per_clk_r;
	reg [31:0] delay_ns_r;
	reg [31:0] rollover_thresh_ns_r;
	reg [15:0] lockout_ns_r;
	reg resync;

	assign running = started;


	reg [31:0] secs_r;
	// Secretly fixed point
	reg [39:0] ns_r;
	// Little pipelining cause 40 bit >= is pricey
	reg [39:0] ns_r_pipe;
	reg [39:0] delay;

	assign secs = secs_r;
	assign ns = ns_r[39:8];
	assign subns = ns_r[7:0];


	reg captured_r;
	reg [31:0] captured_secs_r;
	reg [31:0] captured_ns_r;
	reg [7:0]  captured_subns_r;

	assign captured = captured_r;
	assign captured_secs = captured_secs_r;
	assign captured_ns = captured_ns_r;
	assign captured_subns = captured_subns_r;


	reg pps_internal;
	reg last_pps;
	reg last_pps_ext;

	reg sysref_internal;
	reg last_sysref;

	always @(posedge clk) begin
		// Housekeeping
		//
		// We're gonna register most of the control inputs for
		// consistency and timing
		mode_r <= mode;
		sanity_mode_r <= sanity_mode;
		ns_per_clk_r <= ns_per_clk;
		subns_per_clk_r <= subns_per_clk;
		capture_mode_r <= capture_mode;
		delay_ns_r <= delay_ns;
		rollover_thresh_ns_r <= rollover_thresh_ns;
		lockout_ns_r <= lockout_ns;
		// We register SYSREF for consistent behavior between SYSREF
		// and PPS so thar counting starts one cycle after the edge is
		// observed on the input port
		sysref_internal <= sysref;
		last_pps <= pps_internal;
		last_sysref <= sysref_internal;
		last_pps_ext <= |(pps & pps_sel);

		// Internal PPS Control
		//
		// Just pulse for one cycle
		if (pps_internal) pps_internal <= 0;
		// Start counter only on positive PPS edge or pulse internal
		// PPS if there is no delay set
		if (last_pps_ext == 0 && (|(pps & pps_sel)) == 1) begin
			if (delay_ns_r != 0)
				delay <= delay + {26'b0, ns_per_clk_r, subns_per_clk_r};
			else pps_internal <= 1;
		end
		// Count up only when counting has already started
		if (delay != 0) delay <= delay + {26'b0, ns_per_clk_r, subns_per_clk_r};
		// Stop Counting and pulse Internal PPS (if delay is enables)
		if (delay[39:8] >= delay_ns_r && delay_ns_r != 0) begin
			pps_internal <= 1;
			delay <= 0;
		end


		// Capture engine
		if (captured_r == 0 && capture_mode_r == 1) begin
			if (pps_internal == 1 && last_pps == 0) begin
				captured_r <= 1;
				captured_secs_r <= secs_r;
				captured_ns_r <= ns_r[39:8];
				captured_subns_r <= ns_r[7:0];
			end
		end
		if (captured_r == 0 && capture_mode_r == 2) begin
			if (sysref_internal == 1 && last_sysref == 0) begin
				captured_r <= 1;
				captured_secs_r <= secs_r;
				captured_ns_r <= ns_r[39:8];
				captured_subns_r <= ns_r[7:0];
			end
		end
		if (captured_r == 1 && capture_mode_r == 0) captured_r <= 0;


		// Counter engine
		if (started == 1) begin
			ns_r <= ns_r + {26'b0, ns_per_clk_r, subns_per_clk_r};
			// We also look two cycles ahead
			ns_r_pipe <= ns_r +
			// Cheeky *2
				{25'b0, ns_per_clk_r, subns_per_clk_r, 1'b0};
			if (mode_r == 1 || mode_r == 2 || mode_r == 5) begin
				if (ns_r_pipe >= 1000*1000*1000*256) begin
					ns_r <= 0;
					secs_r <= secs_r + 1;
					ns_r_pipe <= 0;
				end
			end
			else begin
				if (pps_internal == 1 && last_pps == 0) begin
					if (ns_r_pipe[39:8] < lockout_ns_r & sanity_mode_r[0]) begin
						resync <= sanity_mode_r[2];
					end
					else if (ns_r_pipe[39:8] >= rollover_thresh_ns_r & ~resync & sanity_mode_r[1]) begin
						ns_r <= 0;
						secs_r <= secs_r + 1;
						ns_r_pipe <= 0;
					end else begin
						resync <= 0;
						ns_r <= 0;
						secs_r <= secs_r + 1;
					end
				end
			end
		end


		// Load engine
		if (started == 0) begin
			case (mode_r)
				1: begin
					started <= 1;
					secs_r <= load_secs;
					ns_r <= {load_ns, load_subns};
				end
				2,
			        3: begin
					started <= pps_internal;
					secs_r <= load_secs;
					ns_r <= {load_ns, load_subns};
				end
				4,
				5: begin
					started <= sysref_internal & ~last_sysref;
					secs_r <= load_secs;
					ns_r <= {load_ns, load_subns};
				end
			endcase
		end
		if (started == 1 && mode == 0) started <= 0;
	end
endmodule
