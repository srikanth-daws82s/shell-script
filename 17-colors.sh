#!/bin/bash/

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"

VALIDATE(){

    if [ $1 -ne 0 ]
     then
          echo "$2... $RED failure"
          exit 1
     else
        echo "$2... $GREEN success"

    fi  

}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then 
    dnf install mysql -y
    VALIDATE $? "installing mysql"

else 
     echo  -e "mysql already ... $YELLOW installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
    
else
    echo  -e "git already ... $YELLOW installed"

fi


