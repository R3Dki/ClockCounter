#!/bin/sh
MCAL=0
REFVAL=0
OUT1="Clock Frequency: "
OUT2="GHz"
DELTA=0
FREQUENCY=0
#calibration
OLDTIME=$(date +%s%N | cut -b1-13)
while [[ $DELTA -le 1000 ]]; do
  TIME=$(date +%s%N | cut -b1-13)
  DELTA=$(( $TIME-$OLDTIME ))
  FREQUENCY=$(( $FREQUENCY+1 ))
done
REFVAL=$((`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`/1000))
MCAL=$(bc -l <<< "($REFVAL/$FREQUENCY)*1000000")
#measurement
while [[ TRUE ]]; do
OLDTIME=$(date +%s%N | cut -b1-13)
DELTA=0
while [[ $DELTA -le 1000 ]]; do
  TIME=$(date +%s%N | cut -b1-13)
  DELTA=$(( $TIME-$OLDTIME ))
  FREQUENCY=$(( FREQUENCY+1 ))
done
clear
printf %s%.5f%s%s%s\\n "$OUT1" "$(bc -l <<< "$FREQUENCY*$MCAL" )e-9" "$OUT2"
FREQUENCY=0
done
