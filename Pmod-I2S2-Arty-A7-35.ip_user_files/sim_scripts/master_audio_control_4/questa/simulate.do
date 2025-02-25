onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib master_audio_control_4_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {master_audio_control_4.udo}

run 1000ns

quit -force
