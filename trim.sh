#!/bin/bash

cat "$1" | tr '[:upper:]' '[:lower:]' > my.txt

deleted=0

while read line
do
	newLine=" "
	for word in $line
	do
		if [[ ${newLine} = *" ${word} "* ]]; then
			let deleted=deleted+1
		else 
			newLine+=$word
			newLine+=" "			
		fi
	done
	echo $newLine	
done < my.txt

echo "Deleted ${deleted} words"