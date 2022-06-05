# clockcounter
TL,DR;
A kind of working CPU Clock Calculator based on cycles, bc(for float math) and cat(for "calibration").

This is my first shell code, it finds the Clock Frequency of your CPU by looking at how many cycles are done per second and then by multiplying this value by a multiplier value calculated by dividing the cat output CPU Frequency by the detected cycles. It  doesn't work well, but the values it gives are in some way near the correct ones(Max 1Ghz of difference in my 2 PCs).
