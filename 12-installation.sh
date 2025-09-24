#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run these script with root privilage"
    exit 1
fi    

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Installing mysql is failed"
    exit 1
 else
    echo "installing mysql is success"   