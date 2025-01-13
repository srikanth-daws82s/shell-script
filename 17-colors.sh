#!/bin/bash/

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){

    if [ $1 -ne 0 ]
     then
          echo "$2... $R failure"
          exit 1
     else
        echo "$2... $G success"

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
     echo  -e "mysql already ... $Y installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
    
else
    echo  -e "git already ... $Y installed"

fi


