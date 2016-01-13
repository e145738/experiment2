#!/bin/sh

if [ $# -eq 2 ] ; then
    alpha=$1
		directory=$2
else
	exit 0
fi
	
sed -i -e "s/alpha = [0-9].[0-9]/alpha = $alpha/g" $derectory/steepest_decent.c

