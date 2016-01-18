#!/bin/sh

for seed in 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
do
	cat data$seed.txt | sed -e "/ctg/d" | sed -e '$d' | tr -cd "0123456789,. \n"  > .data_$seed
done


gnuplot <<ENDRATE 
set terminal pdf
set output "3_1.pdf"
set ylabel "error"
set xlabel "iterations"
set style fill solid border lc rgb "black"
plot ".data_1000" using 1:2 with lines, ".data_2000" using 1:2 with lines, ".data_3000" using 1:2 with lines, ".data_4000" using 1:2 with lines, ".data_5000" using 1:2 with lines, ".data_6000" using 1:2 with lines, ".data_7000" using 1:2 with lines, ".data_8000" using 1:2 with lines, ".data_9000" using 1:2 with lines, ".data_10000" using 1:2 with lines
exit
ENDRATE


open 3_1.pdf

