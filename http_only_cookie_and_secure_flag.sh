#! /bin/bash

echo "Enter file name:"
read filename

if [[ -f $filename ]]
    then
        if grep -q "Header edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure" $filename
            then
                echo "Http Only Cookie and Secure Flag Passed..."
        else
                echo "Http Only Cookie and Secure Flag Failed..."
                echo "Adding required directives to file..."
                printf "\nHeader edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure" >> $filename
        fi

else
    echo "No file exits with this name"
fi
    

