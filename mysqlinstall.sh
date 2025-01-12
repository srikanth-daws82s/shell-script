#!/bin/bash/

USERID=$(id -u)

if [ $USERTD -ne 0]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf install mysql -y

dnf install git -y