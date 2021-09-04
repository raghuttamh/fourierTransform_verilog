# Realizing 8-point Fourier Transform
### Third Stage
The issue with the floating points was resolved. Every values in the system were mulitplied by a factor, here 100, to help eliminating the floating points, instead, the final input is now scaled to 100x and so is the output. The components of the twiddle factor, cos() and sin(), are evaluated by using the values stored in the **.data** files and this can be used to calculate twiddle factor.

### Second Stage
Tried to do it in Verilog only, I could implement it successfully, but the problem arised when I had to inculcate the floating points of the W(8), hence I have put some random values now, just demonstrate the working status. Looking forward to get better!

### First Stage
This is a System Verilog code, to compute Fourier Transform (here, It was 4-point only)
I could successfully run the simulation using SYNOPSYS VCS available commercially at EDA Playground.

Note: I had actually tried to use Verilog for this, but then it kept showing me that the ports declared needed to be packed and started giving me errors which doesn't seem to get resolved, which I ultimately got resorted to use SystemVerilog to do the same.
