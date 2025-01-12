#!/bin/bash/

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then 
    if [ $? -ne 0 ]
     then
          echo "installing mysql... failure"
          exit 1
     else
        echo "installing mysql... success"

    fi   

else 
     echo "mysql already ... installed"


   

#  if [ $? -ne 0 ]
#     then
#          echo "installing mysql... failure"
#          exit 1
#     else
#         echo "installing mysql... success"

#     fi   


    
dnf list installed git
if [ $? -ne 0 ]
then
    if [ $? -ne 0 ]
    then
        echo "installing git ... failure"
        exit 1
     else
        echo "installing git ... success"
     fi
    
else
    echo "git already ... installed"

fi


