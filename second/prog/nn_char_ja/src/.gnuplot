set xlabel "iteration"
set ylabel "error"
set title "Error transition per iteration on BP-NN"
set terminal postscript eps
set output "result-seed1.eps"
plot "result-seed1.data" with line
