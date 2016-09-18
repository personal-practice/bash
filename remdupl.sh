#!/bin/bash

bool=0
if [ $# -gt 0 ] && [ $1 = "-c" ]; then
	bool=1
fi
prevLine=""
count=0

while read line; do
	if [ "$prevLine" == "" ]; then
		count=1
	elif [ "$prevLine" == "$line" ]; then
		let count=count+1
	else
		if [ $bool -eq 1 ]; then
			echo -n "${count} "
		fi
		echo $prevLine
		count=1
	fi
	prevLine=$line
done

let count=$count+1
if [ $bool -eq 1 ]; then
	echo -n "${count} "
fi
echo $prevLine