#! /bin/bash

echo "Enter file name:"
read filename

declare git_checks=('<DirectoryMatch “^/.*/\.git/”>' 'Order deny,allow ' 'Deny from all' '</DirectoryMatch>')

if [[ -f $filename ]]
    then
        for ((i=0;i<${#git_checks[@]};i++))
            do
                if grep -q "${git_checks[i]}" $filename
                    then
                        echo "Passed check ${i}"
                    else
                        echo "Check ${i} failed..."
                        echo "Adding required directives to file..."
                        printf "\n"
                        echo ${git_checks[i]} >> $filename
                fi
            done
    
        

else
    echo "No file exits with this name"
fi
    



