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

#define CONTROL_ADDR_MODE_REG_DATA            0x10
#define CONTROL_BITS_MODE_REG_DATA            32
#define CONTROL_ADDR_COUNTER_CONFIG_REG_DATA  0x18
#define CONTROL_BITS_COUNTER_CONFIG_REG_DATA  16
#define CONTROL_ADDR_COUNTER_STATUS_REG_DATA  0x20
#define CONTROL_BITS_COUNTER_STATUS_REG_DATA  16
#define CONTROL_ADDR_COUNTER_STATUS_REG_CTRL  0x24
#define CONTROL_ADDR_DELAY_NS_REG_DATA        0x28
#define CONTROL_BITS_DELAY_NS_REG_DATA        32
#define CONTROL_ADDR_LOAD_SECS_REG_DATA       0x30
#define CONTROL_BITS_LOAD_SECS_REG_DATA       32
#define CONTROL_ADDR_LOAD_NS_REG_DATA         0x38
#define CONTROL_BITS_LOAD_NS_REG_DATA         32
#define CONTROL_ADDR_LOAD_SUBNS_REG_DATA      0x40
#define CONTROL_BITS_LOAD_SUBNS_REG_DATA      8
#define CONTROL_ADDR_CAPTURE_SECS_REG_DATA    0x48
#define CONTROL_BITS_CAPTURE_SECS_REG_DATA    32
#define CONTROL_ADDR_CAPTURE_SECS_REG_CTRL    0x4c
#define CONTROL_ADDR_CAPTURE_NS_REG_DATA      0x58
#define CONTROL_BITS_CAPTURE_NS_REG_DATA      32
#define CONTROL_ADDR_CAPTURE_NS_REG_CTRL      0x5c
#define CONTROL_ADDR_CAPTURE_SUBNS_REG_DATA   0x68
#define CONTROL_BITS_CAPTURE_SUBNS_REG_DATA   8
#define CONTROL_ADDR_CAPTURE_SUBNS_REG_CTRL   0x6c
#define CONTROL_ADDR_CURRENT_SECS_REG_DATA    0x78
#define CONTROL_BITS_CURRENT_SECS_REG_DATA    32
#define CONTROL_ADDR_CURRENT_SECS_REG_CTRL    0x7c
#define CONTROL_ADDR_CURRENT_NS_REG_DATA      0x88
#define CONTROL_BITS_CURRENT_NS_REG_DATA      32
#define CONTROL_ADDR_CURRENT_NS_REG_CTRL      0x8c
#define CONTROL_ADDR_CURRENT_SUBNS_REG_DATA   0x98
#define CONTROL_BITS_CURRENT_SUBNS_REG_DATA   8
#define CONTROL_ADDR_CURRENT_SUBNS_REG_CTRL   0x9c
#define CONTROL_ADDR_LOCKOUT_REG_DATA         0xa8
#define CONTROL_BITS_LOCKOUT_REG_DATA         16
#define CONTROL_ADDR_ROLLOVER_THRESH_REG_DATA 0xb0
#define CONTROL_BITS_ROLLOVER_THRESH_REG_DATA 32
