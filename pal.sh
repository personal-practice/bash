#!/bin/bash

if [ ! -f $1 ];
	then exit 1
fi

while read line
do
	backup=$line
	line=$(echo "$line" | tr -d '?.[:blank:]' | tr '[:upper:]' '[:lower:]')
	
	rev=""
	len=${#line}	

	for ((i=$len-1; i>=0; i--));
	do
		rev+=${line:$i:1}
	done

	if [ $rev = $line ];
		then echo $backup
	fi
done < $1