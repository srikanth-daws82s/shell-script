#!/bin/bash/

num1=$1
num2=$2
TIMESTAMP=$(date)
echo "script executed at : $TIMESTAMP"
SUM=$(($num1+$num2))
echo "SUM of $num1 and $num2 is: $SUM"