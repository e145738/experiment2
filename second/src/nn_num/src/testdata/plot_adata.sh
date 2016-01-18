#!/bin/sh

gnuplot <<ENDRATE 
set terminal pdf
set output "adata.pdf"
set ylabel "rate"
set xlabel "EVA"
set key outside
set style fill solid border lc rgb "black"
plot "a_data.csv" using 1:2 with lines title "a-down.txt","a_data.csv" using 1:3 with lines title "a-up.txt","a_data.csv" using 1:4 with lines title "a-left.txt","a_data.csv" using 1:5 with lines title "a-right.txt"
exit
ENDRATE

open adata.pdf
