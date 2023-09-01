# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
mode_reg { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
counter_config_reg { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
counter_status_reg { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
delay_ns_reg { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
load_secs_reg { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
load_ns_reg { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
load_subns_reg { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
capture_secs_reg { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
capture_ns_reg { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 88
	offset_end 95
}
capture_subns_reg { 
	dir O
	width 8
	depth 1
	mode ap_vld
	offset 104
	offset_end 111
}
current_secs_reg { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 120
	offset_end 127
}
current_ns_reg { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 136
	offset_end 143
}
current_subns_reg { 
	dir O
	width 8
	depth 1
	mode ap_vld
	offset 152
	offset_end 159
}
lockout_reg { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
rollover_thresh_reg { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 176
	offset_end 183
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename pps_synchronizer_control_control_axilite \
			name pps_synchronizer_control_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode COR \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler pps_synchronizer_control_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name load_secs_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_load_secs_ctl \
    op interface \
    ports { load_secs_ctl { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name load_ns_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_load_ns_ctl \
    op interface \
    ports { load_ns_ctl { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name load_subns_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_load_subns_ctl \
    op interface \
    ports { load_subns_ctl { O 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name ns_per_clk_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_ns_per_clk_ctl \
    op interface \
    ports { ns_per_clk_ctl { O 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name subns_per_clk_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_subns_per_clk_ctl \
    op interface \
    ports { subns_per_clk_ctl { O 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name delay_ns_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_delay_ns_ctl \
    op interface \
    ports { delay_ns_ctl { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name lockout_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_lockout_ctl \
    op interface \
    ports { lockout_ctl { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name rollover_thresh_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_rollover_thresh_ctl \
    op interface \
    ports { rollover_thresh_ctl { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name mode_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_mode_ctl \
    op interface \
    ports { mode_ctl { O 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name capture_mode_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_capture_mode_ctl \
    op interface \
    ports { capture_mode_ctl { O 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name sanity_mode_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_sanity_mode_ctl \
    op interface \
    ports { sanity_mode_ctl { O 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name pps_sel_ctl \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_pps_sel_ctl \
    op interface \
    ports { pps_sel_ctl { O 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name captured_secs_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_captured_secs_in \
    op interface \
    ports { captured_secs_in { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name captured_ns_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_captured_ns_in \
    op interface \
    ports { captured_ns_in { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name captured_subns_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_captured_subns_in \
    op interface \
    ports { captured_subns_in { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name running_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_running_in \
    op interface \
    ports { running_in { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name secs_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_secs_in \
    op interface \
    ports { secs_in { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name ns_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_ns_in \
    op interface \
    ports { ns_in { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name subns_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_subns_in \
    op interface \
    ports { subns_in { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name captured_in \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_captured_in \
    op interface \
    ports { captured_in { I 1 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


