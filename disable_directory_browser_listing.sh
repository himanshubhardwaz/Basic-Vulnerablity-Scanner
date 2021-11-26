#! /bin/bash

#echo "Enter file name: "
#read filename

if [[ -f $filename ]]
    then
#        sed -i '' 's|<Directory>\([0-9]\{0,\}\)</Directory>|<Directory> '"Options -Indexes"' </Directory>|g' $filename

        sed -i -e '/<Directory>/,/<\/Directory>/d' $filename
        printf "<Directory> \n Options -Indexes \n </Directory>" >> $filename

#        sed -i '' 's|<Directory>/,/</Directory>/c\<Directory>\nOptions -Indexes \n</Directory>/g' $filename

else
        echo "File dosen't exits"
fi
