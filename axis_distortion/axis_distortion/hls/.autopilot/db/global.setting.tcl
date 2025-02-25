
set TopModule "master_audio_control"
set ClockPeriod 10
set ClockList ap_clk
set AxiliteClockList {}
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 1
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix master_audio_control_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xc7a35t:-cpg236:-1
set SourceFiles {sc {} c {../../control.cpp ../../eq.cpp ../../echo.cpp ../../distortion.cpp}}
set SourceFlags {sc {} c {{} {} {} {}}}
set DirectiveFile {}
set TBFiles {verilog {C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_control.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_echo.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/common.h C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_distortion.cpp} bc {C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_control.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_echo.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/common.h C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_distortion.cpp} sc {C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_control.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_echo.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/common.h C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_distortion.cpp} vhdl {C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_control.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_echo.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/common.h C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_distortion.cpp} c {} cas {C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_control.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_echo.cpp C:/Users/ZachKrueger/Documents/AI/axis_distortion/common.h C:/Users/ZachKrueger/Documents/AI/axis_distortion/test_distortion.cpp}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile {}
set ApsFile hls.aps
set AvePath ../../.
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/artix7/artix7}}}
set HPFPO 0
