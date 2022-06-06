#!/bin/sh
#variables
NOCOLOR=
DELTA=0
FREQUENCY=0
#calibration
OLDTIME=$(date +%s%N | cut -b1-13)
while [[ $DELTA -lt 1000 ]]; do
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
  while [[ $DELTA -lt 1000 ]]; do
    TIME=$(date +%s%N | cut -b1-13)
    DELTA=$(( $TIME-$OLDTIME ))
    FREQUENCY=$(( FREQUENCY+1 ))
  done
  REFVAL=$((`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`/1000))
  clear
  REFVAL=$(bc -l <<< "$REFVAL/$DELTA" )
  FREQUENCY=$(bc -l <<< "($FREQUENCY*$MCAL)/1000000000" )
  DELTA=$(bc -l <<< "($REFVAL-$FREQUENCY)*1000" )
#colorcheck
  if [[ $(echo "$DELTA > 100" | bc) -eq 1 ]]; then
    COLOR=$'\e[0;31m'
  elif [[ $(echo "$DELTA < -100" | bc) -eq 1 ]]; then
    COLOR=$'\e[0;31m'
  else
    COLOR=$'\e[0;32m'
  fi
  #output
  printf %s%s%.3f%s\\n%s%s%.3f%s\\n%s%.3f%s\\n "Clock Frequency: " $COLOR "$FREQUENCY" "GHz" $'\e[0m' "Reference Value: " "$REFVAL" "$GHz" "Difference: " "$DELTA" "MHz"
  FREQUENCY=0
done
