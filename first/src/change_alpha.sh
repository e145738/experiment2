#!/bin/sh

if [ $# -eq 1 ] ; then
    alpha=$1
else
	exit 0
fi
	
sed -i -e "s/alpha = [0-9].[0-9]/alpha = $alpha/g" steepest_decent.c

