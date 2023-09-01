-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity pps_synchronizer_control_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 8;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    mode_reg              :out  STD_LOGIC_VECTOR(31 downto 0);
    counter_config_reg    :out  STD_LOGIC_VECTOR(15 downto 0);
    counter_status_reg    :in   STD_LOGIC_VECTOR(15 downto 0);
    counter_status_reg_ap_vld :in   STD_LOGIC;
    delay_ns_reg          :out  STD_LOGIC_VECTOR(31 downto 0);
    load_secs_reg         :out  STD_LOGIC_VECTOR(31 downto 0);
    load_ns_reg           :out  STD_LOGIC_VECTOR(31 downto 0);
    load_subns_reg        :out  STD_LOGIC_VECTOR(7 downto 0);
    capture_secs_reg      :in   STD_LOGIC_VECTOR(31 downto 0);
    capture_secs_reg_ap_vld :in   STD_LOGIC;
    capture_ns_reg        :in   STD_LOGIC_VECTOR(31 downto 0);
    capture_ns_reg_ap_vld :in   STD_LOGIC;
    capture_subns_reg     :in   STD_LOGIC_VECTOR(7 downto 0);
    capture_subns_reg_ap_vld :in   STD_LOGIC;
    current_secs_reg      :in   STD_LOGIC_VECTOR(31 downto 0);
    current_secs_reg_ap_vld :in   STD_LOGIC;
    current_ns_reg        :in   STD_LOGIC_VECTOR(31 downto 0);
    current_ns_reg_ap_vld :in   STD_LOGIC;
    current_subns_reg     :in   STD_LOGIC_VECTOR(7 downto 0);
    current_subns_reg_ap_vld :in   STD_LOGIC;
    lockout_reg           :out  STD_LOGIC_VECTOR(15 downto 0);
    rollover_thresh_reg   :out  STD_LOGIC_VECTOR(31 downto 0)
);
end entity pps_synchronizer_control_control_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of mode_reg
--        bit 31~0 - mode_reg[31:0] (Read/Write)
-- 0x14 : reserved
-- 0x18 : Data signal of counter_config_reg
--        bit 15~0 - counter_config_reg[15:0] (Read/Write)
--        others   - reserved
-- 0x1c : reserved
-- 0x20 : Data signal of counter_status_reg
--        bit 15~0 - counter_status_reg[15:0] (Read)
--        others   - reserved
-- 0x24 : Control signal of counter_status_reg
--        bit 0  - counter_status_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x28 : Data signal of delay_ns_reg
--        bit 31~0 - delay_ns_reg[31:0] (Read/Write)
-- 0x2c : reserved
-- 0x30 : Data signal of load_secs_reg
--        bit 31~0 - load_secs_reg[31:0] (Read/Write)
-- 0x34 : reserved
-- 0x38 : Data signal of load_ns_reg
--        bit 31~0 - load_ns_reg[31:0] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of load_subns_reg
--        bit 7~0 - load_subns_reg[7:0] (Read/Write)
--        others  - reserved
-- 0x44 : reserved
-- 0x48 : Data signal of capture_secs_reg
--        bit 31~0 - capture_secs_reg[31:0] (Read)
-- 0x4c : Control signal of capture_secs_reg
--        bit 0  - capture_secs_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x58 : Data signal of capture_ns_reg
--        bit 31~0 - capture_ns_reg[31:0] (Read)
-- 0x5c : Control signal of capture_ns_reg
--        bit 0  - capture_ns_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x68 : Data signal of capture_subns_reg
--        bit 7~0 - capture_subns_reg[7:0] (Read)
--        others  - reserved
-- 0x6c : Control signal of capture_subns_reg
--        bit 0  - capture_subns_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x78 : Data signal of current_secs_reg
--        bit 31~0 - current_secs_reg[31:0] (Read)
-- 0x7c : Control signal of current_secs_reg
--        bit 0  - current_secs_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x88 : Data signal of current_ns_reg
--        bit 31~0 - current_ns_reg[31:0] (Read)
-- 0x8c : Control signal of current_ns_reg
--        bit 0  - current_ns_reg_ap_vld (Read/COR)
--        others - reserved
-- 0x98 : Data signal of current_subns_reg
--        bit 7~0 - current_subns_reg[7:0] (Read)
--        others  - reserved
-- 0x9c : Control signal of current_subns_reg
--        bit 0  - current_subns_reg_ap_vld (Read/COR)
--        others - reserved
-- 0xa8 : Data signal of lockout_reg
--        bit 15~0 - lockout_reg[15:0] (Read/Write)
--        others   - reserved
-- 0xac : reserved
-- 0xb0 : Data signal of rollover_thresh_reg
--        bit 31~0 - rollover_thresh_reg[31:0] (Read/Write)
-- 0xb4 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of pps_synchronizer_control_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_MODE_REG_DATA_0            : INTEGER := 16#10#;
    constant ADDR_MODE_REG_CTRL              : INTEGER := 16#14#;
    constant ADDR_COUNTER_CONFIG_REG_DATA_0  : INTEGER := 16#18#;
    constant ADDR_COUNTER_CONFIG_REG_CTRL    : INTEGER := 16#1c#;
    constant ADDR_COUNTER_STATUS_REG_DATA_0  : INTEGER := 16#20#;
    constant ADDR_COUNTER_STATUS_REG_CTRL    : INTEGER := 16#24#;
    constant ADDR_DELAY_NS_REG_DATA_0        : INTEGER := 16#28#;
    constant ADDR_DELAY_NS_REG_CTRL          : INTEGER := 16#2c#;
    constant ADDR_LOAD_SECS_REG_DATA_0       : INTEGER := 16#30#;
    constant ADDR_LOAD_SECS_REG_CTRL         : INTEGER := 16#34#;
    constant ADDR_LOAD_NS_REG_DATA_0         : INTEGER := 16#38#;
    constant ADDR_LOAD_NS_REG_CTRL           : INTEGER := 16#3c#;
    constant ADDR_LOAD_SUBNS_REG_DATA_0      : INTEGER := 16#40#;
    constant ADDR_LOAD_SUBNS_REG_CTRL        : INTEGER := 16#44#;
    constant ADDR_CAPTURE_SECS_REG_DATA_0    : INTEGER := 16#48#;
    constant ADDR_CAPTURE_SECS_REG_CTRL      : INTEGER := 16#4c#;
    constant ADDR_CAPTURE_NS_REG_DATA_0      : INTEGER := 16#58#;
    constant ADDR_CAPTURE_NS_REG_CTRL        : INTEGER := 16#5c#;
    constant ADDR_CAPTURE_SUBNS_REG_DATA_0   : INTEGER := 16#68#;
    constant ADDR_CAPTURE_SUBNS_REG_CTRL     : INTEGER := 16#6c#;
    constant ADDR_CURRENT_SECS_REG_DATA_0    : INTEGER := 16#78#;
    constant ADDR_CURRENT_SECS_REG_CTRL      : INTEGER := 16#7c#;
    constant ADDR_CURRENT_NS_REG_DATA_0      : INTEGER := 16#88#;
    constant ADDR_CURRENT_NS_REG_CTRL        : INTEGER := 16#8c#;
    constant ADDR_CURRENT_SUBNS_REG_DATA_0   : INTEGER := 16#98#;
    constant ADDR_CURRENT_SUBNS_REG_CTRL     : INTEGER := 16#9c#;
    constant ADDR_LOCKOUT_REG_DATA_0         : INTEGER := 16#a8#;
    constant ADDR_LOCKOUT_REG_CTRL           : INTEGER := 16#ac#;
    constant ADDR_ROLLOVER_THRESH_REG_DATA_0 : INTEGER := 16#b0#;
    constant ADDR_ROLLOVER_THRESH_REG_CTRL   : INTEGER := 16#b4#;
    constant ADDR_BITS         : INTEGER := 8;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_mode_reg        : UNSIGNED(31 downto 0) := (others => '0');
    signal int_counter_config_reg : UNSIGNED(15 downto 0) := (others => '0');
    signal int_counter_status_reg_ap_vld : STD_LOGIC;
    signal int_counter_status_reg : UNSIGNED(15 downto 0) := (others => '0');
    signal int_delay_ns_reg    : UNSIGNED(31 downto 0) := (others => '0');
    signal int_load_secs_reg   : UNSIGNED(31 downto 0) := (others => '0');
    signal int_load_ns_reg     : UNSIGNED(31 downto 0) := (others => '0');
    signal int_load_subns_reg  : UNSIGNED(7 downto 0) := (others => '0');
    signal int_capture_secs_reg_ap_vld : STD_LOGIC;
    signal int_capture_secs_reg : UNSIGNED(31 downto 0) := (others => '0');
    signal int_capture_ns_reg_ap_vld : STD_LOGIC;
    signal int_capture_ns_reg  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_capture_subns_reg_ap_vld : STD_LOGIC;
    signal int_capture_subns_reg : UNSIGNED(7 downto 0) := (others => '0');
    signal int_current_secs_reg_ap_vld : STD_LOGIC;
    signal int_current_secs_reg : UNSIGNED(31 downto 0) := (others => '0');
    signal int_current_ns_reg_ap_vld : STD_LOGIC;
    signal int_current_ns_reg  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_current_subns_reg_ap_vld : STD_LOGIC;
    signal int_current_subns_reg : UNSIGNED(7 downto 0) := (others => '0');
    signal int_lockout_reg     : UNSIGNED(15 downto 0) := (others => '0');
    signal int_rollover_thresh_reg : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_MODE_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_mode_reg(31 downto 0), 32);
                    when ADDR_COUNTER_CONFIG_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_counter_config_reg(15 downto 0), 32);
                    when ADDR_COUNTER_STATUS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_counter_status_reg(15 downto 0), 32);
                    when ADDR_COUNTER_STATUS_REG_CTRL =>
                        rdata_data(0) <= int_counter_status_reg_ap_vld;
                    when ADDR_DELAY_NS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_delay_ns_reg(31 downto 0), 32);
                    when ADDR_LOAD_SECS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_load_secs_reg(31 downto 0), 32);
                    when ADDR_LOAD_NS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_load_ns_reg(31 downto 0), 32);
                    when ADDR_LOAD_SUBNS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_load_subns_reg(7 downto 0), 32);
                    when ADDR_CAPTURE_SECS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_capture_secs_reg(31 downto 0), 32);
                    when ADDR_CAPTURE_SECS_REG_CTRL =>
                        rdata_data(0) <= int_capture_secs_reg_ap_vld;
                    when ADDR_CAPTURE_NS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_capture_ns_reg(31 downto 0), 32);
                    when ADDR_CAPTURE_NS_REG_CTRL =>
                        rdata_data(0) <= int_capture_ns_reg_ap_vld;
                    when ADDR_CAPTURE_SUBNS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_capture_subns_reg(7 downto 0), 32);
                    when ADDR_CAPTURE_SUBNS_REG_CTRL =>
                        rdata_data(0) <= int_capture_subns_reg_ap_vld;
                    when ADDR_CURRENT_SECS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_current_secs_reg(31 downto 0), 32);
                    when ADDR_CURRENT_SECS_REG_CTRL =>
                        rdata_data(0) <= int_current_secs_reg_ap_vld;
                    when ADDR_CURRENT_NS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_current_ns_reg(31 downto 0), 32);
                    when ADDR_CURRENT_NS_REG_CTRL =>
                        rdata_data(0) <= int_current_ns_reg_ap_vld;
                    when ADDR_CURRENT_SUBNS_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_current_subns_reg(7 downto 0), 32);
                    when ADDR_CURRENT_SUBNS_REG_CTRL =>
                        rdata_data(0) <= int_current_subns_reg_ap_vld;
                    when ADDR_LOCKOUT_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_lockout_reg(15 downto 0), 32);
                    when ADDR_ROLLOVER_THRESH_REG_DATA_0 =>
                        rdata_data <= RESIZE(int_rollover_thresh_reg(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    mode_reg             <= STD_LOGIC_VECTOR(int_mode_reg);
    counter_config_reg   <= STD_LOGIC_VECTOR(int_counter_config_reg);
    delay_ns_reg         <= STD_LOGIC_VECTOR(int_delay_ns_reg);
    load_secs_reg        <= STD_LOGIC_VECTOR(int_load_secs_reg);
    load_ns_reg          <= STD_LOGIC_VECTOR(int_load_ns_reg);
    load_subns_reg       <= STD_LOGIC_VECTOR(int_load_subns_reg);
    lockout_reg          <= STD_LOGIC_VECTOR(int_lockout_reg);
    rollover_thresh_reg  <= STD_LOGIC_VECTOR(int_rollover_thresh_reg);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_MODE_REG_DATA_0) then
                    int_mode_reg(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_mode_reg(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COUNTER_CONFIG_REG_DATA_0) then
                    int_counter_config_reg(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_counter_config_reg(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_counter_status_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (counter_status_reg_ap_vld = '1') then
                    int_counter_status_reg <= UNSIGNED(counter_status_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_counter_status_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (counter_status_reg_ap_vld = '1') then
                    int_counter_status_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_COUNTER_STATUS_REG_CTRL) then
                    int_counter_status_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DELAY_NS_REG_DATA_0) then
                    int_delay_ns_reg(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_delay_ns_reg(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_LOAD_SECS_REG_DATA_0) then
                    int_load_secs_reg(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_load_secs_reg(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_LOAD_NS_REG_DATA_0) then
                    int_load_ns_reg(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_load_ns_reg(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_LOAD_SUBNS_REG_DATA_0) then
                    int_load_subns_reg(7 downto 0) <= (UNSIGNED(WDATA(7 downto 0)) and wmask(7 downto 0)) or ((not wmask(7 downto 0)) and int_load_subns_reg(7 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_secs_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (capture_secs_reg_ap_vld = '1') then
                    int_capture_secs_reg <= UNSIGNED(capture_secs_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_secs_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (capture_secs_reg_ap_vld = '1') then
                    int_capture_secs_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CAPTURE_SECS_REG_CTRL) then
                    int_capture_secs_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_ns_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (capture_ns_reg_ap_vld = '1') then
                    int_capture_ns_reg <= UNSIGNED(capture_ns_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_ns_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (capture_ns_reg_ap_vld = '1') then
                    int_capture_ns_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CAPTURE_NS_REG_CTRL) then
                    int_capture_ns_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_subns_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (capture_subns_reg_ap_vld = '1') then
                    int_capture_subns_reg <= UNSIGNED(capture_subns_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_capture_subns_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (capture_subns_reg_ap_vld = '1') then
                    int_capture_subns_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CAPTURE_SUBNS_REG_CTRL) then
                    int_capture_subns_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_secs_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (current_secs_reg_ap_vld = '1') then
                    int_current_secs_reg <= UNSIGNED(current_secs_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_secs_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (current_secs_reg_ap_vld = '1') then
                    int_current_secs_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CURRENT_SECS_REG_CTRL) then
                    int_current_secs_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_ns_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (current_ns_reg_ap_vld = '1') then
                    int_current_ns_reg <= UNSIGNED(current_ns_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_ns_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (current_ns_reg_ap_vld = '1') then
                    int_current_ns_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CURRENT_NS_REG_CTRL) then
                    int_current_ns_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_subns_reg <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (current_subns_reg_ap_vld = '1') then
                    int_current_subns_reg <= UNSIGNED(current_subns_reg);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_current_subns_reg_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (current_subns_reg_ap_vld = '1') then
                    int_current_subns_reg_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_CURRENT_SUBNS_REG_CTRL) then
                    int_current_subns_reg_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_LOCKOUT_REG_DATA_0) then
                    int_lockout_reg(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_lockout_reg(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_ROLLOVER_THRESH_REG_DATA_0) then
                    int_rollover_thresh_reg(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_rollover_thresh_reg(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
