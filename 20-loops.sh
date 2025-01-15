USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-log" 
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%d-%m-%y-%H-%S-%M")
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){

    if [ $1 -ne 0 ]
     then
          echo "$2... $R failure $N"
          exit 1
     else
        echo "$2... $G success $N"

    fi  

}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

for package in $@
do
     dnf list installed $package &>>$LOG_FILE_NAME
     if [ $? -ne 0 ] 
     then 
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "installing $package"

     else 
        echo  -e "$package already ... $Y installed $N"
    fi
done