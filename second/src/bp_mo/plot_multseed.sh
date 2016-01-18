#!/bin/sh

exec_file=./bp_mo

for seed in 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000
do
	$exec_file $seed > .data_origin$seed
	cat .data_origin$seed | sed -e "/ctg/d" | sed -e '$d' | tr -cd "0123456789,.\n" | sed -e 's/,/ /g' > .data_$seed
	rm .data_origin$seed
done


gnuplot <<ENDRATE 
set terminal pdf
set output "iterations_vs_error.pdf"
set ylabel "error"
set yrange [0:0.2]
set xlabel "iterations"
set style fill solid border lc rgb "black"
plot ".data_1000" using 1:2 with lines, ".data_2000" using 1:2 with lines, ".data_3000" using 1:2 with lines, ".data_4000" using 1:2 with lines, ".data_5000" using 1:2 with lines, ".data_6000" using 1:2 with lines, ".data_7000" using 1:2 with lines, ".data_8000" using 1:2 with lines, ".data_9000" using 1:2 with lines, ".data_10000" using 1:2 with lines
exit
ENDRATE


open iterations_vs_error.pdf

