#!/bin/bash

if [ "$1" = "-results" ]; then
	parties=" "
	totalVotes=0
	while read line; do
		party=$(echo $line | cut -d ' ' -f1)
		votes=$(echo $line | cut -d ' ' -f2)

		let totalVotes=totalVotes+votes

		if [[ ! "$parties" =~ "$party" ]]; then
			parties+=$party
			parties+=" "
		fi
	done < results.txt

	for p in $parties; do
		# Get total votes of party
		v=0
		for line in $(grep "^$p " results.txt); do
			c=$(echo $line | cut -d ' ' -f2)
			let v=v+c
		done		

		# Get percentage
		per=$(($v*100/$totalVotes))

		echo "${p}: votes ${v}, i.e. ${per}%"

	done

	exit 0
fi

while [ $# -gt 0 ]; do
	echo "$1 $2" >> results.txt
	shift ; shift
done