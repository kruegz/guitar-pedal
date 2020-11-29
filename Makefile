
testbench:=avc_tb
# testbench:=avc_testbench

gtkwave:=/Applications/gtkwave.app/Contents/Resources/bin/gtkwave

all: build run

build:
	iverilog -g2012 -c sources.txt -s $(testbench)

run:
	./a.out

waves:
	$(gtkwave) test.vcd

.PHONY : clean
clean:
	-rm a.out waves.vcd	