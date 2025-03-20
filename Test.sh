#!/bin/bash

FirstName=$1
LastName=$2
TimeString=$(date -d "+5 hours" "+%T")
Show=$3

if [ "$Joke" == "true" ]; then
    echo "Here's a joke for you: Why don't scientists trust atoms? Because they make up everything!"
fi

echo "Hello, $FirstName $LastName"
echo "The current time is: $TimeString at home."
echo "Need anything else?"