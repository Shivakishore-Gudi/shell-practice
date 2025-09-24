#! /bin/bash

echo "please enter the number:"
read Number

if [ $(($Number%2) -eq 0) ]; then
    echo "Given number $Number is Even"
else
    echo "Given number $Number is Odd"