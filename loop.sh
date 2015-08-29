#!/bin/bash



# loop test

i=0
MAX=3

while [ $i -lt $MAX ]
do

	echo "number" $i
	let "i+=1"
done
