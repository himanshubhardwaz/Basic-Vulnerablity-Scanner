
#! /bin/bash

#echo "Enter file name:"
#read filename

if [[ -f $filename ]]
    then
        if grep -q "Header always append X-Frame-Options SAMEORIGIN" $filename
            then
                echo "Clickjacking test Passed..."
        else
                echo "Clickjacking test Failed..."
                echo "Adding required directives to file..."
                printf "\nHeader always append X-Frame-Options SAMEORIGIN" >> $filename
        fi

else
    echo "No file exits with this name"
fi
    

