#! /bin/bash

echo "Enter file name:"
read filename

if [[ -f $filename ]]
    then
        if grep -q "ServerTokens Prod" $filename && grep -q "ServerSignature Off" $filename
            then
                echo "Server banner test passed..."
        else
                echo "Server banner test failed..."
                echo "Adding required directives to file to remove server banner..."
                echo "ServerTokens Prod" >> $filename
                echo "ServerSignature Off" >> $filename
        fi

else
    echo "No file exits with this name"
fi
    
