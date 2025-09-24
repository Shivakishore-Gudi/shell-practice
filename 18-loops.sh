#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privilage"
    exit 1
fi    

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error:: Installing $2 is ... $R failed $N"
        exit 1
    else
        echo "installing $2 is ... $G success $N" 
    fi 
}

for package in $@
do
    #check package is installed or not
    dnf list installed $package &>>$LOG_FILE

if [ $? -ne 0 ]; then
    
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
else
    echo -e "$package already exists ... $Y Skipping $N "
fi 
done

