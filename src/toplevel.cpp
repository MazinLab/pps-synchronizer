#include "ap_int.h"
#include <stdint.h>

#include "toplevel.hpp"

typedef ap_uint<4> counter_mode_t;
typedef ap_uint<2> capture_mode_t;
typedef ap_uint<3> sanity_mode_t;
typedef ap_uint<3> pps_sel_t;
typedef ap_uint<6> ns_per_clk_t;
typedef uint8_t subns_t;
typedef uint32_t ns_t;
typedef uint32_t secs_t;
typedef ap_uint<1> wire_t;

typedef struct {
        counter_mode_t mode;
        capture_mode_t capture_mode;
	sanity_mode_t sanity_mode;
	pps_sel_t pps_sel;
} mode_config_t;

typedef struct {
        subns_t subns_per_clk;
        ns_per_clk_t ns_per_clk;
} counter_config_t;

typedef struct {
        wire_t running;
        wire_t captured;
} counter_status_t;

void pps_synchronizer_control(
    /* AXI Registers */
    mode_config_t *mode_reg, counter_config_t *counter_config_reg,
    counter_status_t *counter_status_reg, ns_t *delay_ns_reg,
    secs_t *load_secs_reg, ns_t *load_ns_reg, subns_t *load_subns_reg,
    secs_t *capture_secs_reg, ns_t *capture_ns_reg, subns_t *capture_subns_reg,
    secs_t *current_secs_reg, ns_t *current_ns_reg, subns_t *current_subns_reg,
    uint16_t *lockout_reg, ns_t *rollover_thresh_reg,
    /* Control Signals */
    secs_t &load_secs_ctl, ns_t &load_ns_ctl, subns_t &load_subns_ctl,
    ns_per_clk_t &ns_per_clk_ctl, subns_t &subns_per_clk_ctl,
    ns_t &delay_ns_ctl, uint16_t &lockout_ctl, ns_t &rollover_thresh_ctl, counter_mode_t &mode_ctl,
    capture_mode_t &capture_mode_ctl, sanity_mode_t &sanity_mode_ctl, pps_sel_t &pps_sel_ctl, secs_t *captured_secs_in,
    ns_t *captured_ns_in, subns_t *captured_subns_in, wire_t *running_in,
    secs_t *secs_in, ns_t *ns_in, subns_t *subns_in, wire_t *captured_in) {
// So clean
#pragma HLS interface mode = ap_ctrl_none port = return

#pragma HLS interface mode = s_axilite port = mode_reg
#pragma HLS interface mode = s_axilite port = counter_config_reg
#pragma HLS interface mode = s_axilite port = counter_status_reg
#pragma HLS interface mode = s_axilite port = delay_ns_reg
#pragma HLS interface mode = s_axilite port = load_secs_reg
#pragma HLS interface mode = s_axilite port = load_ns_reg
#pragma HLS interface mode = s_axilite port = load_subns_reg
#pragma HLS interface mode = s_axilite port = capture_secs_reg
#pragma HLS interface mode = s_axilite port = capture_ns_reg
#pragma HLS interface mode = s_axilite port = capture_subns_reg
#pragma HLS interface mode = s_axilite port = current_secs_reg
#pragma HLS interface mode = s_axilite port = current_ns_reg
#pragma HLS interface mode = s_axilite port = current_subns_reg
#pragma HLS interface mode = s_axilite port = lockout_reg
#pragma HLS interface mode = s_axilite port = rollover_thresh_reg

#pragma HLS interface mode = ap_none port = load_secs_ctl
#pragma HLS interface mode = ap_none port = load_ns_ctl
#pragma HLS interface mode = ap_none port = load_subns_ctl
#pragma HLS interface mode = ap_none port = ns_per_clk_ctl
#pragma HLS interface mode = ap_none port = subns_per_clk_ctl
#pragma HLS interface mode = ap_none port = delay_ns_ctl
#pragma HLS interface mode = ap_none port = lockout_ctl
#pragma HLS interface mode = ap_none port = rollover_thresh_ctl
#pragma HLS interface mode = ap_none port = mode_ctl
#pragma HLS interface mode = ap_none port = capture_mode_ctl
#pragma HLS interface mode = ap_none port = sanity_mode_ctl
#pragma HLS interface mode = ap_none port = pps_sel_ctl
#pragma HLS interface mode = ap_none port = captured_secs_in
#pragma HLS interface mode = ap_none port = captured_ns_in
#pragma HLS interface mode = ap_none port = captured_subns_in
#pragma HLS interface mode = ap_none port = running_in
#pragma HLS interface mode = ap_none port = secs_in
#pragma HLS interface mode = ap_none port = ns_in
#pragma HLS interface mode = ap_none port = subns_in
#pragma HLS interface mode = ap_none port = captured_in

        mode_ctl = mode_reg->mode;
        capture_mode_ctl = mode_reg->capture_mode;
	sanity_mode_ctl = mode_reg->sanity_mode;
	pps_sel_ctl = mode_reg->pps_sel;
        ns_per_clk_ctl = counter_config_reg->ns_per_clk;
        subns_per_clk_ctl = counter_config_reg->subns_per_clk;

        counter_status_reg->running = *running_in;
        counter_status_reg->captured = *captured_in;

        delay_ns_ctl = *delay_ns_reg;
        load_secs_ctl = *load_secs_reg;
        load_ns_ctl = *load_ns_reg;
        load_subns_ctl = *load_subns_reg;
	lockout_ctl = *lockout_reg;
	rollover_thresh_ctl = *rollover_thresh_reg;

        *capture_secs_reg = *captured_secs_in;
        *capture_ns_reg = *captured_ns_in;
        *capture_subns_reg = *captured_subns_in;

        *current_secs_reg = *secs_in;
        *current_ns_reg = *ns_in;
        *current_subns_reg = *subns_in;
}
