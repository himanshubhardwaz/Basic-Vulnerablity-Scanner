#! /bin/bash

echo "Enter file name:"
read filename

if [[ -f $filename ]]
    then
        if grep -q "ServerTokens Prod" $filename && grep -q "ServerSignature Off" $filename
            then
                echo "Tracing http request already disabled..."
        else
                echo "Server banner test failed..."
                echo "Adding required directives to file to Disbale trace http request..."
                echo "TraceEnable off" >> $filename
                echo "Tracing http request disabled"
        fi

else
    echo "No file exits with this name"
fi
    
