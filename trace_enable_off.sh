echo "Enter file name:"
read filename

if [[ -f $filename ]]
    then
        if grep -q "TraceEnable off" $filename
            then
                echo "Trace Disable test passed..."
        else
                echo "Trace Disable test failed..."
                echo "Adding required directives to file to remove server banner..."
                echo "TraceEnable off" >> $filename
        fi

else
    echo "No file exits with this name"
fi