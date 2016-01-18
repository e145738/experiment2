#!/bin/sh

datafile="mozi.csv"

gnuplot <<ENDRATE 
set terminal pdf
set output "mozi.pdf"
set ylabel "rate"
set xlabel "EVA"
set key outside
set style fill solid border lc rgb "black"
plot "$datafile" using 1:2 with lines title "a", "$datafile" using 1:3 with lines title "ka", "$datafile" using 1:4 with lines title "sa", "$datafile" using 1:5 with lines title "ta", "$datafile" using 1:6 with lines title "na", "$datafile" using 1:7 with lines title "ha", "$datafile" using 1:8 with lines title "ma", "$datafile" using 1:9 with lines title "ya", "$datafile" using 1:10 with lines title "ra", "$datafile" using 1:11 with lines title "wa"
exit
ENDRATE

open mozi.pdf
