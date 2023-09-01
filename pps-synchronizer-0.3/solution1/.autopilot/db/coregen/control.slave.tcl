dict set slaves control {ports {mode_reg {type i_ap_none width 32} counter_config_reg {type i_ap_none width 16} counter_status_reg {type o_ap_vld width 16} delay_ns_reg {type i_ap_none width 32} load_secs_reg {type i_ap_none width 32} load_ns_reg {type i_ap_none width 32} load_subns_reg {type i_ap_none width 8} capture_secs_reg {type o_ap_vld width 32} capture_ns_reg {type o_ap_vld width 32} capture_subns_reg {type o_ap_vld width 8} current_secs_reg {type o_ap_vld width 32} current_ns_reg {type o_ap_vld width 32} current_subns_reg {type o_ap_vld width 8} lockout_reg {type i_ap_none width 16} rollover_thresh_reg {type i_ap_none width 32}} mems {} has_ctrl 0}
set datawidth 32
set addrwidth 64
set intr_clr_mode COR
