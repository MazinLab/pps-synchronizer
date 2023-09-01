# This script segment is generated automatically by AutoPilot

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


