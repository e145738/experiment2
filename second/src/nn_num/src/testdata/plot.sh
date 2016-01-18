#!/bin/sh

datafile="deter_data.txt"

gnuplot <<ENDRATE 
set terminal pdf
set output "deter.pdf"
set ylabel "rate"
set xlabel "file"
set style fill solid border lc rgb "black"
plot "$datafile" using 1:2 with lines notitle
exit
ENDRATE

open deter.pdf
