#! /bin/bash

#echo "Enter Filename with location if not in same directory of your httpd-ssl.conf file: "
#read sslfile

if [[ -f $sslfile ]]
    then
            # Modifing SSLCipherSuite directive in httpd-ssl.conf to accept only higher encryption algorithms
            if grep -q "SSLCipherSuite HIGH:!MEDIUM:!aNULL:!MD5:!RC4" $sslfile
                then
                    echo "Cipher test 1 passed, using only higher encryption algorithms"
            else
                    echo "Cipher test 1 Failed, Modifing SSLCipherSuite directive in httpd-ssl.conf"
                    printf "SSLCipherSuite HIGH:!MEDIUM:!aNULL:!MD5:!RC4" >> sslfile
            fi
            
            #Modifing SSLProtocol directive in httpd-ssl.conf to accept only TLS 1.2+
            
            if grep -q "SSLProtocol –ALL +TLSv1.2" $sslfile
                then
                    echo "Cipher test 2 passed, using TLS 1.2+"
            else
                    echo "Cipher test 2 Failed, Modifing SSLProtocol directive in httpd-ssl.conf to accept only TLS 1.2+"
           
                    printf "SSLProtocol –ALL +TLSv1.2" >> sslfile
            fi
else
            echo "Invalid file name"
fi
    
