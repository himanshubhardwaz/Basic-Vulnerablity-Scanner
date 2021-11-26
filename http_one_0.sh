#! /bin/bash

#echo "Enter file name:"
#read filename

declare http_checks=('RewriteEngine On' 'RewriteCond %{THE_REQUEST} !HTTP/1.1$' 'RewriteRule .* - [F]')

if [[ -f $filename ]]
    then
        for ((i=0;i<${#http_checks[@]};i++))
            do
                if grep -q "${http_checks[i]}" $filename
                    then
                        echo "Passed check ${i}"
                    else
                        echo "Check ${i} failed..."
                        echo "Adding required directives to file..."
                        printf "\n"
                        echo ${http_checks[i]} >> $filename
                fi
            done
    
        

else
    echo "No file exits with this name"
fi
    



