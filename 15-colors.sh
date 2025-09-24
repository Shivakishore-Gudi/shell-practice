#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

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

dnf installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "mysql already exists ... $Y Skipping $N "
fi   

dnf installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exists ... $Y Skipping $N "
fi 

dnf installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "python3 already exists ... $Y Skipping $N "
fi 