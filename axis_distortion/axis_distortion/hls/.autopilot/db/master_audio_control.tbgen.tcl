set moduleName master_audio_control
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 2
set C_modelName {master_audio_control}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ in_r int 64 regular {axi_s 0 volatile  { in_r Data } }  }
	{ out_r int 64 regular {axi_s 1 volatile  { out_r Data } }  }
	{ enable_distortion uint 1 regular  }
	{ enable_echo uint 1 regular  }
	{ enable_eq uint 1 regular  }
	{ hard_clip_level int 32 regular  }
	{ gain_low int 32 regular  }
	{ gain_mid int 32 regular  }
	{ gain_high int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "in_r", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "out_r", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "enable_distortion", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "enable_echo", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "enable_eq", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "hard_clip_level", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gain_low", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gain_mid", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gain_high", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_r_TDATA sc_in sc_lv 64 signal 0 } 
	{ in_r_TVALID sc_in sc_logic 1 invld 0 } 
	{ in_r_TREADY sc_out sc_logic 1 inacc 0 } 
	{ out_r_TDATA sc_out sc_lv 64 signal 1 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 1 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 1 } 
	{ enable_distortion sc_in sc_lv 1 signal 2 } 
	{ enable_echo sc_in sc_lv 1 signal 3 } 
	{ enable_eq sc_in sc_lv 1 signal 4 } 
	{ hard_clip_level sc_in sc_lv 32 signal 5 } 
	{ gain_low sc_in sc_lv 32 signal 6 } 
	{ gain_mid sc_in sc_lv 32 signal 7 } 
	{ gain_high sc_in sc_lv 32 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_r", "role": "TDATA" }} , 
 	{ "name": "in_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_r", "role": "TVALID" }} , 
 	{ "name": "in_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_r", "role": "TREADY" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_r", "role": "TDATA" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "TVALID" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_r", "role": "TREADY" }} , 
 	{ "name": "enable_distortion", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "enable_distortion", "role": "default" }} , 
 	{ "name": "enable_echo", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "enable_echo", "role": "default" }} , 
 	{ "name": "enable_eq", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "enable_eq", "role": "default" }} , 
 	{ "name": "hard_clip_level", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hard_clip_level", "role": "default" }} , 
 	{ "name": "gain_low", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gain_low", "role": "default" }} , 
 	{ "name": "gain_mid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gain_mid", "role": "default" }} , 
 	{ "name": "gain_high", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gain_high", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "master_audio_control",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "20",
		"VariableLatency" : "0", "ExactLatency" : "50", "EstimateLatencyMin" : "50", "EstimateLatencyMax" : "50",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_r", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_r", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "enable_distortion", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable_echo", "Type" : "None", "Direction" : "I"},
			{"Name" : "enable_eq", "Type" : "None", "Direction" : "I"},
			{"Name" : "hard_clip_level", "Type" : "None", "Direction" : "I"},
			{"Name" : "gain_low", "Type" : "None", "Direction" : "I"},
			{"Name" : "gain_mid", "Type" : "None", "Direction" : "I"},
			{"Name" : "gain_high", "Type" : "None", "Direction" : "I"},
			{"Name" : "delay_index", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_16", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_17", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_18", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_19", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_20", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_21", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_15", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_3", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_13_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_14_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_15_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_16_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_17_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_18_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_19_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_20_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_21_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_6_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_7_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_7_max_dsp_1_U5", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitodp_32s_64_6_no_dsp_1_U6", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_17ns_17ns_17_21_1_U7", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_24_1_1_U8", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_10s_34_1_1_U9", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_11s_35_1_1_U10", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_24_1_1_U11", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_11ns_35_1_1_U12", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_10ns_34_1_1_U13", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_12ns_36_1_1_U14", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_10s_34_1_1_U15", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_11ns_35_1_1_U16", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_12ns_36_1_1_U17", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_10ns_34_1_1_U18", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_10s_34_1_1_U19", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_11s_35_1_1_U20", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_3_24_1_1_U21", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp1_fifo_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp2_fifo_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_r_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_r_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	master_audio_control {
		in_r {Type I LastRead 0 FirstWrite -1}
		out_r {Type O LastRead -1 FirstWrite 30}
		enable_distortion {Type I LastRead 0 FirstWrite -1}
		enable_echo {Type I LastRead 0 FirstWrite -1}
		enable_eq {Type I LastRead 0 FirstWrite -1}
		hard_clip_level {Type I LastRead 0 FirstWrite -1}
		gain_low {Type I LastRead 0 FirstWrite -1}
		gain_mid {Type I LastRead 1 FirstWrite -1}
		gain_high {Type I LastRead 2 FirstWrite -1}
		delay_index {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_13 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_14 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_15 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_16 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_17 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_18 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_19 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_20 {Type IO LastRead -1 FirstWrite -1}
		echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_21 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_11 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_12 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_13 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_14 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ4echoRN3hls6streamI11axis_sampleLi0EEES3_bE12delay_buffer_15 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_1 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_2 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_low_3 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_1 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_2 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_mid_3 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_1 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_2 {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high {Type IO LastRead -1 FirstWrite -1}
		eq_3band_stream_stream_axis_sample_0_bool_float_float_float_delay_high_3 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "50", "Max" : "50"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_r { axis {  { in_r_TDATA in_data 0 64 }  { in_r_TVALID in_vld 0 1 }  { in_r_TREADY in_acc 1 1 } } }
	out_r { axis {  { out_r_TDATA out_data 1 64 }  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 } } }
	enable_distortion { ap_none {  { enable_distortion in_data 0 1 } } }
	enable_echo { ap_none {  { enable_echo in_data 0 1 } } }
	enable_eq { ap_none {  { enable_eq in_data 0 1 } } }
	hard_clip_level { ap_none {  { hard_clip_level in_data 0 32 } } }
	gain_low { ap_none {  { gain_low in_data 0 32 } } }
	gain_mid { ap_none {  { gain_mid in_data 0 32 } } }
	gain_high { ap_none {  { gain_high in_data 0 32 } } }
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
