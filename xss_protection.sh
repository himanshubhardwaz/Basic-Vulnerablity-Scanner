
#! /bin/bash

#echo "Enter file name:"
#read filename

if [[ -f $filename ]]
    then
        if grep -q 'Header set X-XSS-Protection "1; mode=block"' $filename
            then
                echo "XSS Protection test Passed..."
        else
                echo "XSS Protection test Failed..."
                echo "Adding required directives to file..."
                printf '\nHeader set X-XSS-Protection "1; mode=block"' >> $filename
        fi

else
    echo "No file exits with this name"
fi
    


