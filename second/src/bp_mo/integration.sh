#!/bin/sh

search_file="./search.txt"

rm .ave_data

for i in `seq 1 100`
do
	rm $search_file
	for j in `seq 1 10`
	do
		cat .data_"$j"000 |	sed -n "$i"p | cut -f 2 -d' ' >> $search_file 
	done

	steps=`cat $search_file`
	sum=0
	for step in $steps
	do
		sum=`echo "$sum + $step" | bc`
	done
	
	sum=`echo "scale=10; $sum / 10" |bc `
	echo $sum >> .ave_data

done

sed -i -e 's/^/0/g' .ave_data
nl -n ln .ave_data > ave_data

