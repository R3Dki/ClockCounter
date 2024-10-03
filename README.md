# clockcounter
TL,DR;
A "working" CPU Clock Calculator based on sum, bc(for float math) and cat(for "calibration" and reference).

This is my first shell code, it finds the Clock Frequency of your CPU by looking at how many 1s are added to a variabiable per second and then by multiplying this value by a multiplier found by dividing the cat output CPU Frequency by the detected 1s. It isn't extremely precise, but the values it gives are in some way near the correct ones(Max 300MHz of difference in my Desktop PC and in my Laptop(only when running at least 2 in this case)).

NOTE: I advise you run this program at least 2/3 times concurrently to get the most precise values, also for the same reason you should "focus" on the shell running ClockCounter because if you don't do it then it'll spit whatever your CPU allows it to use.

It depends on: bc, cat
I made it to learn bash basics and since i don't have creativity, while creating a clock frequency detector for mindustry to learn how to use processors, i decided to convert it to arduino and then my computer.

### It's pretty obvious that your scheduler is going to affect readings. This script wasn't really made to be perfectly accurate.

I also uploaded an arduino version.

# Arduino
The Arduino version works perfectly fine.<br>
Tested on:<br>
Arduino UNO Rev3<br>
Arduino Mega 2560<br>
ST Nucleo 64-F446RE
