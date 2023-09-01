set moduleName pps_synchronizer_control
set isTopModule 1
set isCombinational 1
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {pps_synchronizer_control}
set C_modelType { void 0 }
set C_modelArgList {
	{ mode_reg int 32 regular {axi_slave 0}  }
	{ counter_config_reg int 16 regular {axi_slave 0}  }
	{ counter_status_reg int 16 regular {axi_slave 1}  }
	{ delay_ns_reg int 32 regular {axi_slave 0}  }
	{ load_secs_reg int 32 regular {axi_slave 0}  }
	{ load_ns_reg int 32 regular {axi_slave 0}  }
	{ load_subns_reg int 8 regular {axi_slave 0}  }
	{ capture_secs_reg int 32 regular {axi_slave 1}  }
	{ capture_ns_reg int 32 regular {axi_slave 1}  }
	{ capture_subns_reg int 8 regular {axi_slave 1}  }
	{ current_secs_reg int 32 regular {axi_slave 1}  }
	{ current_ns_reg int 32 regular {axi_slave 1}  }
	{ current_subns_reg int 8 regular {axi_slave 1}  }
	{ lockout_reg int 16 regular {axi_slave 0}  }
	{ rollover_thresh_reg int 32 regular {axi_slave 0}  }
	{ load_secs_ctl int 32 regular {pointer 1}  }
	{ load_ns_ctl int 32 regular {pointer 1}  }
	{ load_subns_ctl int 8 regular {pointer 1}  }
	{ ns_per_clk_ctl int 6 regular {pointer 1}  }
	{ subns_per_clk_ctl int 8 regular {pointer 1}  }
	{ delay_ns_ctl int 32 regular {pointer 1}  }
	{ lockout_ctl int 16 regular {pointer 1}  }
	{ rollover_thresh_ctl int 32 regular {pointer 1}  }
	{ mode_ctl int 4 regular {pointer 1}  }
	{ capture_mode_ctl int 2 regular {pointer 1}  }
	{ sanity_mode_ctl int 3 regular {pointer 1}  }
	{ pps_sel_ctl int 3 regular {pointer 1}  }
	{ captured_secs_in int 32 regular {pointer 0}  }
	{ captured_ns_in int 32 regular {pointer 0}  }
	{ captured_subns_in int 8 regular {pointer 0}  }
	{ running_in int 1 regular {pointer 0}  }
	{ secs_in int 32 regular {pointer 0}  }
	{ ns_in int 32 regular {pointer 0}  }
	{ subns_in int 8 regular {pointer 0}  }
	{ captured_in int 1 regular {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mode_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "counter_config_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "counter_status_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "delay_ns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "load_secs_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "load_ns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "load_subns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "capture_secs_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":72}, "offset_end" : {"out":79}} , 
 	{ "Name" : "capture_ns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":88}, "offset_end" : {"out":95}} , 
 	{ "Name" : "capture_subns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":104}, "offset_end" : {"out":111}} , 
 	{ "Name" : "current_secs_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":120}, "offset_end" : {"out":127}} , 
 	{ "Name" : "current_ns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":136}, "offset_end" : {"out":143}} , 
 	{ "Name" : "current_subns_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":152}, "offset_end" : {"out":159}} , 
 	{ "Name" : "lockout_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":168}, "offset_end" : {"in":175}} , 
 	{ "Name" : "rollover_thresh_reg", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":176}, "offset_end" : {"in":183}} , 
 	{ "Name" : "load_secs_ctl", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "load_ns_ctl", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "load_subns_ctl", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ns_per_clk_ctl", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "subns_per_clk_ctl", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "delay_ns_ctl", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "lockout_ctl", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rollover_thresh_ctl", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mode_ctl", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "capture_mode_ctl", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sanity_mode_ctl", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pps_sel_ctl", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "captured_secs_in", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "captured_ns_in", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "captured_subns_in", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "running_in", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "secs_in", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ns_in", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "subns_in", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "captured_in", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ load_secs_ctl sc_out sc_lv 32 signal 15 } 
	{ load_ns_ctl sc_out sc_lv 32 signal 16 } 
	{ load_subns_ctl sc_out sc_lv 8 signal 17 } 
	{ ns_per_clk_ctl sc_out sc_lv 6 signal 18 } 
	{ subns_per_clk_ctl sc_out sc_lv 8 signal 19 } 
	{ delay_ns_ctl sc_out sc_lv 32 signal 20 } 
	{ lockout_ctl sc_out sc_lv 16 signal 21 } 
	{ rollover_thresh_ctl sc_out sc_lv 32 signal 22 } 
	{ mode_ctl sc_out sc_lv 4 signal 23 } 
	{ capture_mode_ctl sc_out sc_lv 2 signal 24 } 
	{ sanity_mode_ctl sc_out sc_lv 3 signal 25 } 
	{ pps_sel_ctl sc_out sc_lv 3 signal 26 } 
	{ captured_secs_in sc_in sc_lv 32 signal 27 } 
	{ captured_ns_in sc_in sc_lv 32 signal 28 } 
	{ captured_subns_in sc_in sc_lv 8 signal 29 } 
	{ running_in sc_in sc_lv 1 signal 30 } 
	{ secs_in sc_in sc_lv 32 signal 31 } 
	{ ns_in sc_in sc_lv 32 signal 32 } 
	{ subns_in sc_in sc_lv 8 signal 33 } 
	{ captured_in sc_in sc_lv 1 signal 34 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"mode_reg","role":"data","value":"16"},{"name":"counter_config_reg","role":"data","value":"24"},{"name":"delay_ns_reg","role":"data","value":"40"},{"name":"load_secs_reg","role":"data","value":"48"},{"name":"load_ns_reg","role":"data","value":"56"},{"name":"load_subns_reg","role":"data","value":"64"},{"name":"lockout_reg","role":"data","value":"168"},{"name":"rollover_thresh_reg","role":"data","value":"176"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"counter_status_reg","role":"data","value":"32"}, {"name":"counter_status_reg","role":"valid","value":"36","valid_bit":"0"},{"name":"capture_secs_reg","role":"data","value":"72"}, {"name":"capture_secs_reg","role":"valid","value":"76","valid_bit":"0"},{"name":"capture_ns_reg","role":"data","value":"88"}, {"name":"capture_ns_reg","role":"valid","value":"92","valid_bit":"0"},{"name":"capture_subns_reg","role":"data","value":"104"}, {"name":"capture_subns_reg","role":"valid","value":"108","valid_bit":"0"},{"name":"current_secs_reg","role":"data","value":"120"}, {"name":"current_secs_reg","role":"valid","value":"124","valid_bit":"0"},{"name":"current_ns_reg","role":"data","value":"136"}, {"name":"current_ns_reg","role":"valid","value":"140","valid_bit":"0"},{"name":"current_subns_reg","role":"data","value":"152"}, {"name":"current_subns_reg","role":"valid","value":"156","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "load_secs_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "load_secs_ctl", "role": "default" }} , 
 	{ "name": "load_ns_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "load_ns_ctl", "role": "default" }} , 
 	{ "name": "load_subns_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "load_subns_ctl", "role": "default" }} , 
 	{ "name": "ns_per_clk_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ns_per_clk_ctl", "role": "default" }} , 
 	{ "name": "subns_per_clk_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "subns_per_clk_ctl", "role": "default" }} , 
 	{ "name": "delay_ns_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "delay_ns_ctl", "role": "default" }} , 
 	{ "name": "lockout_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "lockout_ctl", "role": "default" }} , 
 	{ "name": "rollover_thresh_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rollover_thresh_ctl", "role": "default" }} , 
 	{ "name": "mode_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mode_ctl", "role": "default" }} , 
 	{ "name": "capture_mode_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "capture_mode_ctl", "role": "default" }} , 
 	{ "name": "sanity_mode_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sanity_mode_ctl", "role": "default" }} , 
 	{ "name": "pps_sel_ctl", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "pps_sel_ctl", "role": "default" }} , 
 	{ "name": "captured_secs_in", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "captured_secs_in", "role": "default" }} , 
 	{ "name": "captured_ns_in", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "captured_ns_in", "role": "default" }} , 
 	{ "name": "captured_subns_in", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "captured_subns_in", "role": "default" }} , 
 	{ "name": "running_in", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "running_in", "role": "default" }} , 
 	{ "name": "secs_in", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "secs_in", "role": "default" }} , 
 	{ "name": "ns_in", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ns_in", "role": "default" }} , 
 	{ "name": "subns_in", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "subns_in", "role": "default" }} , 
 	{ "name": "captured_in", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "captured_in", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pps_synchronizer_control",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mode_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "counter_config_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "counter_status_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "delay_ns_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "load_secs_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "load_ns_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "load_subns_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "capture_secs_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "capture_ns_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "capture_subns_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "current_secs_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "current_ns_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "current_subns_reg", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "lockout_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "rollover_thresh_reg", "Type" : "None", "Direction" : "I"},
			{"Name" : "load_secs_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "load_ns_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "load_subns_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "ns_per_clk_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "subns_per_clk_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "delay_ns_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "lockout_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "rollover_thresh_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "mode_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "capture_mode_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "sanity_mode_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "pps_sel_ctl", "Type" : "None", "Direction" : "O"},
			{"Name" : "captured_secs_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "captured_ns_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "captured_subns_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "running_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "secs_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "ns_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "subns_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "captured_in", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pps_synchronizer_control {
		mode_reg {Type I LastRead 0 FirstWrite -1}
		counter_config_reg {Type I LastRead 0 FirstWrite -1}
		counter_status_reg {Type O LastRead -1 FirstWrite 0}
		delay_ns_reg {Type I LastRead 0 FirstWrite -1}
		load_secs_reg {Type I LastRead 0 FirstWrite -1}
		load_ns_reg {Type I LastRead 0 FirstWrite -1}
		load_subns_reg {Type I LastRead 0 FirstWrite -1}
		capture_secs_reg {Type O LastRead -1 FirstWrite 0}
		capture_ns_reg {Type O LastRead -1 FirstWrite 0}
		capture_subns_reg {Type O LastRead -1 FirstWrite 0}
		current_secs_reg {Type O LastRead -1 FirstWrite 0}
		current_ns_reg {Type O LastRead -1 FirstWrite 0}
		current_subns_reg {Type O LastRead -1 FirstWrite 0}
		lockout_reg {Type I LastRead 0 FirstWrite -1}
		rollover_thresh_reg {Type I LastRead 0 FirstWrite -1}
		load_secs_ctl {Type O LastRead -1 FirstWrite 0}
		load_ns_ctl {Type O LastRead -1 FirstWrite 0}
		load_subns_ctl {Type O LastRead -1 FirstWrite 0}
		ns_per_clk_ctl {Type O LastRead -1 FirstWrite 0}
		subns_per_clk_ctl {Type O LastRead -1 FirstWrite 0}
		delay_ns_ctl {Type O LastRead -1 FirstWrite 0}
		lockout_ctl {Type O LastRead -1 FirstWrite 0}
		rollover_thresh_ctl {Type O LastRead -1 FirstWrite 0}
		mode_ctl {Type O LastRead -1 FirstWrite 0}
		capture_mode_ctl {Type O LastRead -1 FirstWrite 0}
		sanity_mode_ctl {Type O LastRead -1 FirstWrite 0}
		pps_sel_ctl {Type O LastRead -1 FirstWrite 0}
		captured_secs_in {Type I LastRead 0 FirstWrite -1}
		captured_ns_in {Type I LastRead 0 FirstWrite -1}
		captured_subns_in {Type I LastRead 0 FirstWrite -1}
		running_in {Type I LastRead 0 FirstWrite -1}
		secs_in {Type I LastRead 0 FirstWrite -1}
		ns_in {Type I LastRead 0 FirstWrite -1}
		subns_in {Type I LastRead 0 FirstWrite -1}
		captured_in {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	load_secs_ctl { ap_none {  { load_secs_ctl out_data 1 32 } } }
	load_ns_ctl { ap_none {  { load_ns_ctl out_data 1 32 } } }
	load_subns_ctl { ap_none {  { load_subns_ctl out_data 1 8 } } }
	ns_per_clk_ctl { ap_none {  { ns_per_clk_ctl out_data 1 6 } } }
	subns_per_clk_ctl { ap_none {  { subns_per_clk_ctl out_data 1 8 } } }
	delay_ns_ctl { ap_none {  { delay_ns_ctl out_data 1 32 } } }
	lockout_ctl { ap_none {  { lockout_ctl out_data 1 16 } } }
	rollover_thresh_ctl { ap_none {  { rollover_thresh_ctl out_data 1 32 } } }
	mode_ctl { ap_none {  { mode_ctl out_data 1 4 } } }
	capture_mode_ctl { ap_none {  { capture_mode_ctl out_data 1 2 } } }
	sanity_mode_ctl { ap_none {  { sanity_mode_ctl out_data 1 3 } } }
	pps_sel_ctl { ap_none {  { pps_sel_ctl out_data 1 3 } } }
	captured_secs_in { ap_none {  { captured_secs_in in_data 0 32 } } }
	captured_ns_in { ap_none {  { captured_ns_in in_data 0 32 } } }
	captured_subns_in { ap_none {  { captured_subns_in in_data 0 8 } } }
	running_in { ap_none {  { running_in in_data 0 1 } } }
	secs_in { ap_none {  { secs_in in_data 0 32 } } }
	ns_in { ap_none {  { ns_in in_data 0 32 } } }
	subns_in { ap_none {  { subns_in in_data 0 8 } } }
	captured_in { ap_none {  { captured_in in_data 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
