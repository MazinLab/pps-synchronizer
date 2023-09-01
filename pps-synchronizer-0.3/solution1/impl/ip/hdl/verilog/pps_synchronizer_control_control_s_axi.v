// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module pps_synchronizer_control_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [31:0]                   mode_reg,
    output wire [15:0]                   counter_config_reg,
    input  wire [15:0]                   counter_status_reg,
    input  wire                          counter_status_reg_ap_vld,
    output wire [31:0]                   delay_ns_reg,
    output wire [31:0]                   load_secs_reg,
    output wire [31:0]                   load_ns_reg,
    output wire [7:0]                    load_subns_reg,
    input  wire [31:0]                   capture_secs_reg,
    input  wire                          capture_secs_reg_ap_vld,
    input  wire [31:0]                   capture_ns_reg,
    input  wire                          capture_ns_reg_ap_vld,
    input  wire [7:0]                    capture_subns_reg,
    input  wire                          capture_subns_reg_ap_vld,
    input  wire [31:0]                   current_secs_reg,
    input  wire                          current_secs_reg_ap_vld,
    input  wire [31:0]                   current_ns_reg,
    input  wire                          current_ns_reg_ap_vld,
    input  wire [7:0]                    current_subns_reg,
    input  wire                          current_subns_reg_ap_vld,
    output wire [15:0]                   lockout_reg,
    output wire [31:0]                   rollover_thresh_reg
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of mode_reg
//        bit 31~0 - mode_reg[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of counter_config_reg
//        bit 15~0 - counter_config_reg[15:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of counter_status_reg
//        bit 15~0 - counter_status_reg[15:0] (Read)
//        others   - reserved
// 0x24 : Control signal of counter_status_reg
//        bit 0  - counter_status_reg_ap_vld (Read/COR)
//        others - reserved
// 0x28 : Data signal of delay_ns_reg
//        bit 31~0 - delay_ns_reg[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of load_secs_reg
//        bit 31~0 - load_secs_reg[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of load_ns_reg
//        bit 31~0 - load_ns_reg[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of load_subns_reg
//        bit 7~0 - load_subns_reg[7:0] (Read/Write)
//        others  - reserved
// 0x44 : reserved
// 0x48 : Data signal of capture_secs_reg
//        bit 31~0 - capture_secs_reg[31:0] (Read)
// 0x4c : Control signal of capture_secs_reg
//        bit 0  - capture_secs_reg_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of capture_ns_reg
//        bit 31~0 - capture_ns_reg[31:0] (Read)
// 0x5c : Control signal of capture_ns_reg
//        bit 0  - capture_ns_reg_ap_vld (Read/COR)
//        others - reserved
// 0x68 : Data signal of capture_subns_reg
//        bit 7~0 - capture_subns_reg[7:0] (Read)
//        others  - reserved
// 0x6c : Control signal of capture_subns_reg
//        bit 0  - capture_subns_reg_ap_vld (Read/COR)
//        others - reserved
// 0x78 : Data signal of current_secs_reg
//        bit 31~0 - current_secs_reg[31:0] (Read)
// 0x7c : Control signal of current_secs_reg
//        bit 0  - current_secs_reg_ap_vld (Read/COR)
//        others - reserved
// 0x88 : Data signal of current_ns_reg
//        bit 31~0 - current_ns_reg[31:0] (Read)
// 0x8c : Control signal of current_ns_reg
//        bit 0  - current_ns_reg_ap_vld (Read/COR)
//        others - reserved
// 0x98 : Data signal of current_subns_reg
//        bit 7~0 - current_subns_reg[7:0] (Read)
//        others  - reserved
// 0x9c : Control signal of current_subns_reg
//        bit 0  - current_subns_reg_ap_vld (Read/COR)
//        others - reserved
// 0xa8 : Data signal of lockout_reg
//        bit 15~0 - lockout_reg[15:0] (Read/Write)
//        others   - reserved
// 0xac : reserved
// 0xb0 : Data signal of rollover_thresh_reg
//        bit 31~0 - rollover_thresh_reg[31:0] (Read/Write)
// 0xb4 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_MODE_REG_DATA_0            = 8'h10,
    ADDR_MODE_REG_CTRL              = 8'h14,
    ADDR_COUNTER_CONFIG_REG_DATA_0  = 8'h18,
    ADDR_COUNTER_CONFIG_REG_CTRL    = 8'h1c,
    ADDR_COUNTER_STATUS_REG_DATA_0  = 8'h20,
    ADDR_COUNTER_STATUS_REG_CTRL    = 8'h24,
    ADDR_DELAY_NS_REG_DATA_0        = 8'h28,
    ADDR_DELAY_NS_REG_CTRL          = 8'h2c,
    ADDR_LOAD_SECS_REG_DATA_0       = 8'h30,
    ADDR_LOAD_SECS_REG_CTRL         = 8'h34,
    ADDR_LOAD_NS_REG_DATA_0         = 8'h38,
    ADDR_LOAD_NS_REG_CTRL           = 8'h3c,
    ADDR_LOAD_SUBNS_REG_DATA_0      = 8'h40,
    ADDR_LOAD_SUBNS_REG_CTRL        = 8'h44,
    ADDR_CAPTURE_SECS_REG_DATA_0    = 8'h48,
    ADDR_CAPTURE_SECS_REG_CTRL      = 8'h4c,
    ADDR_CAPTURE_NS_REG_DATA_0      = 8'h58,
    ADDR_CAPTURE_NS_REG_CTRL        = 8'h5c,
    ADDR_CAPTURE_SUBNS_REG_DATA_0   = 8'h68,
    ADDR_CAPTURE_SUBNS_REG_CTRL     = 8'h6c,
    ADDR_CURRENT_SECS_REG_DATA_0    = 8'h78,
    ADDR_CURRENT_SECS_REG_CTRL      = 8'h7c,
    ADDR_CURRENT_NS_REG_DATA_0      = 8'h88,
    ADDR_CURRENT_NS_REG_CTRL        = 8'h8c,
    ADDR_CURRENT_SUBNS_REG_DATA_0   = 8'h98,
    ADDR_CURRENT_SUBNS_REG_CTRL     = 8'h9c,
    ADDR_LOCKOUT_REG_DATA_0         = 8'ha8,
    ADDR_LOCKOUT_REG_CTRL           = 8'hac,
    ADDR_ROLLOVER_THRESH_REG_DATA_0 = 8'hb0,
    ADDR_ROLLOVER_THRESH_REG_CTRL   = 8'hb4,
    WRIDLE                          = 2'd0,
    WRDATA                          = 2'd1,
    WRRESP                          = 2'd2,
    WRRESET                         = 2'd3,
    RDIDLE                          = 2'd0,
    RDDATA                          = 2'd1,
    RDRESET                         = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [31:0]                   int_mode_reg = 'b0;
    reg  [15:0]                   int_counter_config_reg = 'b0;
    reg                           int_counter_status_reg_ap_vld;
    reg  [15:0]                   int_counter_status_reg = 'b0;
    reg  [31:0]                   int_delay_ns_reg = 'b0;
    reg  [31:0]                   int_load_secs_reg = 'b0;
    reg  [31:0]                   int_load_ns_reg = 'b0;
    reg  [7:0]                    int_load_subns_reg = 'b0;
    reg                           int_capture_secs_reg_ap_vld;
    reg  [31:0]                   int_capture_secs_reg = 'b0;
    reg                           int_capture_ns_reg_ap_vld;
    reg  [31:0]                   int_capture_ns_reg = 'b0;
    reg                           int_capture_subns_reg_ap_vld;
    reg  [7:0]                    int_capture_subns_reg = 'b0;
    reg                           int_current_secs_reg_ap_vld;
    reg  [31:0]                   int_current_secs_reg = 'b0;
    reg                           int_current_ns_reg_ap_vld;
    reg  [31:0]                   int_current_ns_reg = 'b0;
    reg                           int_current_subns_reg_ap_vld;
    reg  [7:0]                    int_current_subns_reg = 'b0;
    reg  [15:0]                   int_lockout_reg = 'b0;
    reg  [31:0]                   int_rollover_thresh_reg = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_MODE_REG_DATA_0: begin
                    rdata <= int_mode_reg[31:0];
                end
                ADDR_COUNTER_CONFIG_REG_DATA_0: begin
                    rdata <= int_counter_config_reg[15:0];
                end
                ADDR_COUNTER_STATUS_REG_DATA_0: begin
                    rdata <= int_counter_status_reg[15:0];
                end
                ADDR_COUNTER_STATUS_REG_CTRL: begin
                    rdata[0] <= int_counter_status_reg_ap_vld;
                end
                ADDR_DELAY_NS_REG_DATA_0: begin
                    rdata <= int_delay_ns_reg[31:0];
                end
                ADDR_LOAD_SECS_REG_DATA_0: begin
                    rdata <= int_load_secs_reg[31:0];
                end
                ADDR_LOAD_NS_REG_DATA_0: begin
                    rdata <= int_load_ns_reg[31:0];
                end
                ADDR_LOAD_SUBNS_REG_DATA_0: begin
                    rdata <= int_load_subns_reg[7:0];
                end
                ADDR_CAPTURE_SECS_REG_DATA_0: begin
                    rdata <= int_capture_secs_reg[31:0];
                end
                ADDR_CAPTURE_SECS_REG_CTRL: begin
                    rdata[0] <= int_capture_secs_reg_ap_vld;
                end
                ADDR_CAPTURE_NS_REG_DATA_0: begin
                    rdata <= int_capture_ns_reg[31:0];
                end
                ADDR_CAPTURE_NS_REG_CTRL: begin
                    rdata[0] <= int_capture_ns_reg_ap_vld;
                end
                ADDR_CAPTURE_SUBNS_REG_DATA_0: begin
                    rdata <= int_capture_subns_reg[7:0];
                end
                ADDR_CAPTURE_SUBNS_REG_CTRL: begin
                    rdata[0] <= int_capture_subns_reg_ap_vld;
                end
                ADDR_CURRENT_SECS_REG_DATA_0: begin
                    rdata <= int_current_secs_reg[31:0];
                end
                ADDR_CURRENT_SECS_REG_CTRL: begin
                    rdata[0] <= int_current_secs_reg_ap_vld;
                end
                ADDR_CURRENT_NS_REG_DATA_0: begin
                    rdata <= int_current_ns_reg[31:0];
                end
                ADDR_CURRENT_NS_REG_CTRL: begin
                    rdata[0] <= int_current_ns_reg_ap_vld;
                end
                ADDR_CURRENT_SUBNS_REG_DATA_0: begin
                    rdata <= int_current_subns_reg[7:0];
                end
                ADDR_CURRENT_SUBNS_REG_CTRL: begin
                    rdata[0] <= int_current_subns_reg_ap_vld;
                end
                ADDR_LOCKOUT_REG_DATA_0: begin
                    rdata <= int_lockout_reg[15:0];
                end
                ADDR_ROLLOVER_THRESH_REG_DATA_0: begin
                    rdata <= int_rollover_thresh_reg[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign mode_reg            = int_mode_reg;
assign counter_config_reg  = int_counter_config_reg;
assign delay_ns_reg        = int_delay_ns_reg;
assign load_secs_reg       = int_load_secs_reg;
assign load_ns_reg         = int_load_ns_reg;
assign load_subns_reg      = int_load_subns_reg;
assign lockout_reg         = int_lockout_reg;
assign rollover_thresh_reg = int_rollover_thresh_reg;
// int_mode_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mode_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODE_REG_DATA_0)
            int_mode_reg[31:0] <= (WDATA[31:0] & wmask) | (int_mode_reg[31:0] & ~wmask);
    end
end

// int_counter_config_reg[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_counter_config_reg[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COUNTER_CONFIG_REG_DATA_0)
            int_counter_config_reg[15:0] <= (WDATA[31:0] & wmask) | (int_counter_config_reg[15:0] & ~wmask);
    end
end

// int_counter_status_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_counter_status_reg <= 0;
    else if (ACLK_EN) begin
        if (counter_status_reg_ap_vld)
            int_counter_status_reg <= counter_status_reg;
    end
end

// int_counter_status_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_counter_status_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (counter_status_reg_ap_vld)
            int_counter_status_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_COUNTER_STATUS_REG_CTRL)
            int_counter_status_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_delay_ns_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_delay_ns_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DELAY_NS_REG_DATA_0)
            int_delay_ns_reg[31:0] <= (WDATA[31:0] & wmask) | (int_delay_ns_reg[31:0] & ~wmask);
    end
end

// int_load_secs_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_load_secs_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOAD_SECS_REG_DATA_0)
            int_load_secs_reg[31:0] <= (WDATA[31:0] & wmask) | (int_load_secs_reg[31:0] & ~wmask);
    end
end

// int_load_ns_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_load_ns_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOAD_NS_REG_DATA_0)
            int_load_ns_reg[31:0] <= (WDATA[31:0] & wmask) | (int_load_ns_reg[31:0] & ~wmask);
    end
end

// int_load_subns_reg[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_load_subns_reg[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOAD_SUBNS_REG_DATA_0)
            int_load_subns_reg[7:0] <= (WDATA[31:0] & wmask) | (int_load_subns_reg[7:0] & ~wmask);
    end
end

// int_capture_secs_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_secs_reg <= 0;
    else if (ACLK_EN) begin
        if (capture_secs_reg_ap_vld)
            int_capture_secs_reg <= capture_secs_reg;
    end
end

// int_capture_secs_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_secs_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (capture_secs_reg_ap_vld)
            int_capture_secs_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CAPTURE_SECS_REG_CTRL)
            int_capture_secs_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_capture_ns_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_ns_reg <= 0;
    else if (ACLK_EN) begin
        if (capture_ns_reg_ap_vld)
            int_capture_ns_reg <= capture_ns_reg;
    end
end

// int_capture_ns_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_ns_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (capture_ns_reg_ap_vld)
            int_capture_ns_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CAPTURE_NS_REG_CTRL)
            int_capture_ns_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_capture_subns_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_subns_reg <= 0;
    else if (ACLK_EN) begin
        if (capture_subns_reg_ap_vld)
            int_capture_subns_reg <= capture_subns_reg;
    end
end

// int_capture_subns_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_capture_subns_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (capture_subns_reg_ap_vld)
            int_capture_subns_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CAPTURE_SUBNS_REG_CTRL)
            int_capture_subns_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_current_secs_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_current_secs_reg <= 0;
    else if (ACLK_EN) begin
        if (current_secs_reg_ap_vld)
            int_current_secs_reg <= current_secs_reg;
    end
end

// int_current_secs_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_current_secs_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (current_secs_reg_ap_vld)
            int_current_secs_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CURRENT_SECS_REG_CTRL)
            int_current_secs_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_current_ns_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_current_ns_reg <= 0;
    else if (ACLK_EN) begin
        if (current_ns_reg_ap_vld)
            int_current_ns_reg <= current_ns_reg;
    end
end

// int_current_ns_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_current_ns_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (current_ns_reg_ap_vld)
            int_current_ns_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CURRENT_NS_REG_CTRL)
            int_current_ns_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_current_subns_reg
always @(posedge ACLK) begin
    if (ARESET)
        int_current_subns_reg <= 0;
    else if (ACLK_EN) begin
        if (current_subns_reg_ap_vld)
            int_current_subns_reg <= current_subns_reg;
    end
end

// int_current_subns_reg_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_current_subns_reg_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (current_subns_reg_ap_vld)
            int_current_subns_reg_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_CURRENT_SUBNS_REG_CTRL)
            int_current_subns_reg_ap_vld <= 1'b0; // clear on read
    end
end

// int_lockout_reg[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_lockout_reg[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOCKOUT_REG_DATA_0)
            int_lockout_reg[15:0] <= (WDATA[31:0] & wmask) | (int_lockout_reg[15:0] & ~wmask);
    end
end

// int_rollover_thresh_reg[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rollover_thresh_reg[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROLLOVER_THRESH_REG_DATA_0)
            int_rollover_thresh_reg[31:0] <= (WDATA[31:0] & wmask) | (int_rollover_thresh_reg[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
