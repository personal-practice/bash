#!/bin/bash

read line < my.txt
id=$(echo $line | cut -d ' ' -f1)
name=$(echo $line | cut -d ' ' --complement -f1)

total=0
basicPoints=0
totalPoints=0
grade=0

while read line 
do
	cid=$(echo $line | cut -d ' ' -f1)
	cgrade=$(echo $line | cut -d ' ' -f2)

	cpoints=$(grep "^${cid} " ${PGCOURSES} | rev | cut -f1 | rev)
	ctype=$(grep "^${cid} " ${PGCOURSES} | rev | cut -f2 | rev)

	let total=total + 1
	let totalPoints=totalPoints + cpoints
	let grade=grade + cgrade*cpoints

	if [ ctype = "B" ]; then
		let basicPoints=basicPoints + cpoints
	fi

done < my.txt

let grade=grade/totalPoints

echo -n "${name} (id = ${id})"
if [ $grade -ge 5 -a $totalPoints -ge 40 -a $basicPoints -g 25 ]; then
	echo " got the diploma."
else
	echo " not finished."
fi

printf "Average mark: %0.2f \n" ${grade}