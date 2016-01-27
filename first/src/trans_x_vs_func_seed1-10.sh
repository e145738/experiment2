#!/bin/bash
set -e

# 探索推移プロットスクリプト(1変数用)。
# x vs f(x)

# 図タイトル(func), シード値(seed) の取得。
if [ $# -eq 2 ] ; then
    func=$1
		level=$2
else
    echo "Usage: prompt> $0 \"gnuplot_style_func\" seed"
    echo "e.g.,: prompt> $0 \"x**2\" 1"
    exit 0
fi

# シミュレーション実行＆データ抽出。
exec_file="$level/steepest_decent"
transition_file="./transition.txt"

if [ -f $transition_file ] ; then
    rm $transition_file
fi

for seed in `seq 1 10`
do
	archive_file=.archive-$seed
	$exec_file $seed > $archive_file
	cat $archive_file | cut -f2,4,6,8 -d" " > .data-$seed
done
# 作図。
gnuplot<<EOF
set xrange [-10:10]
set terminal pdf
set output "seed-1-10.pdf"
set title "$func"
set xlabel "x"
set ylabel "f(x)"
plot $func, ".data-1" using 2:4 with lp title "seed=1", ".data-2" using 2:4 with lp title "seed=2", ".data-3" using 2:4 with lp title "seed=3", ".data-4" using 2:4 with lp title "seed=4", ".data-5" using 2:4 with lp title "seed=5", ".data-6" using 2:4 with lp title "seed=6", ".data-7" using 2:4 with lp title "seed=7", ".data-8" using 2:4 with lp title "seed=8", ".data-9" using 2:4 with lp title "seed=9", ".data-10" using 2:4 with lp title "seed=10"
 
EOF
