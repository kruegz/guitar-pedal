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

## Background
* Effects
  * https://en.wikipedia.org/wiki/Effects_unit
  * https://en.wikipedia.org/wiki/Category:Audio_effects
  * Distortion
    * https://en.wikipedia.org/wiki/Distortion_(music)
    * Clipping
      * Performs truncation of peaks to a minimum or maximum limit
      * Used to achieve general distortion, overdrive (soft clipping), "fuzz box" effects (near square wave)
      * Non-linear
      * Hard clipping is a complete cutoff beyond limit. Soft clipping is a reduced gain beyond limit.
      * https://en.wikipedia.org/wiki/Clipping_(signal_processing)
      * Extreme version of limiter: https://en.wikipedia.org/wiki/Limiter
  * Dynamics
    * Volume and amplitude effects
    * Boost/volume effect
      * Scale amplitude by a constant factor
    * Compressor
      * Reduce volume of loud sounds and increase volume of quiet sounds
      * https://en.wikipedia.org/wiki/Dynamic_range_compression
  * Filters
    * Alter frequency content
    * Equalizer
      * An equalizer is a set of linear filters that strengthen ("boost") or weaken ("cut") specific frequency regions.
      * https://en.wikipedia.org/wiki/Equalization_(audio)
    * Talk box
    * Wah-wah
  * Modulation
    * Chorus
    * Flanger
    * Phaser
    * Ring modulator
    * Tremelo
    * Vibrato
  * Pitch/frequency
    * Pitch shifter
      * Modifies pitch by altering frequency
    * Harmonizer
  * Time based
    * Delay/echo
      * Combines live data with previous data
    * Reverb
      * Large number of echos
  * Feedback
  * Pitch correction
  * Bitcrusher
    * Reduce fidelity by downsampling
  
 
