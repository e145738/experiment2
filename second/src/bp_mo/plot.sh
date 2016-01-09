#!/bin/sh

gnuplot <<ENDRATE 
set terminal pdf
set output "plot.pdf"
set ylabel "error"
set yrange [0:0.1]
set xlabel "iterations"
set style fill solid border lc rgb "black"
plot data1.dat using 1:2 with lines notitle
exit
ENDRATE

open plot.pdf
