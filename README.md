# guitar-pedal
Guitar effects pedal built on FPGA

# Notes

## Requirements
* Guitar audio effects pedal controller built using digital signal processing (DSP) on a field programmable gate array (FPGA).
* Uses an analog to digital converter (ADC) to convert input guitar audio into a stream of digital data
* Performs digital signal processing algorithms on FPGA to achieve audio effects
* Uses a digital to analog converter to convert output digital stream into analog output audio
* Audio effects:
  * Volume control
  * Echo
  * Reverb
  * Overdrive
  * Distortion
  * Equalizer
  * Tuner

## Components
* Digilent Basys 3 Artix-7 FPGA Board
  * Features the Xilinx Artix-7 FPGA: XC7A35T-1CPG236C
  * https://www.xilinx.com/products/boards-and-kits/1-54wqge.html
* Pmod I2S2
  * Cirrus CS5343 Multi-Bit Audio A/D Converter
  * Cirrus CS4344 Stereo D/A Converter
  * 24-bit resolution per channel
  * Input sample rates up to 108KHz
  * https://www.xilinx.com/products/boards-and-kits/1-54wqge.html
  
## Integration
* Pmod I2S2 + Basys 3
  * https://blog.digilentinc.com/where-to-plug-in-your-pmod-fpga/
