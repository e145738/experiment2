#!/bin/bash
set -e

# 探索推移プロットスクリプト(1変数用)。
# x vs f(x)

# 図タイトル(func), シード値(seed) の取得。
if [ $# -eq 3 ] ; then
		seed1=$1
		seed2=$2
		seed3=$3
else
    echo "Usage: prompt> $0 \"gnuplot_style_func\" seed"
    exit 0
fi

# シミュレーション実行＆データ抽出。
exec_file="./steepest_decent"
transition_file="./transition.txt"
exec_file1="./Compare"

if [ -f $transition_file ] ; then
    rm $transition_file
fi

for seed in $seed1 $seed2 $seed3
do
	archive_file=.archive-$seed
	$exec_file $seed > $archive_file
	cat $archive_file | cut -f2,4,6,8 -d" " > .data-$seed
done

echo "seed $seed1 finish f(x,y)" 
tail -c 14 .data-$seed1 | cut -c-13
seed1min=`tail -c 14 .data-$seed1 | cut -c-13 `
echo "$seed1min + 0" | bc

echo "seed $seed2 finish f(x,y)" 
tail -c 14 .data-$seed2 | cut -c-13
seed2min=`tail -c 14 .data-$seed2 | cut -c-13`
echo "$seed2min + 0" | bc

echo "seed $seed3 finish f(x,y)" 
tail -c 14 .data-$seed3 | cut -c-13
seed3min=`tail -c 14 .data-$seed3 | cut -c-13`


echo "最適解は `$exec_file1 $seed1min $seed2min $seed3min` である"

# 作図。
gnuplot<<EOF
set xrange [-10:10]
set terminal pdf
set output "seed.pdf"
set title "-x*cos(x)"
set xlabel "steps"
set ylabel "f(x)"
plot -x*cos(x), ".data-$seed1" using 2:4 with lp, ".data-$seed2" using 2:4 with lp, ".data-$seed3" using 2:4 with lp
 
EOF
