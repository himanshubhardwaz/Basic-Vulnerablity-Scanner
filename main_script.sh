#! /bin/bash

echo -n "Enter the file location and name of the httpd.conf: "
read filename

echo -n "Enter ssl Filename with location if not in same directory of your httpd-ssl.conf file: "
read sslfile

if [ -f $filename ] || [ -f $sslfile ]
    then
        export filename=$filename
        export sslfile=$sslfile
        bash git_source_code_exposure.sh
        bash remove_server_banner.sh
        bash disable_directory_browser_listing.sh
        bash disable_trace_http_request.sh
        bash http_only_cookie_and_secure_flag.sh
        bash clickjacking.sh
        bash xss_protection.sh
        bash http_one_0.sh
        bash strong_ssl_cipher.sh
else
        echo -n "File not found pls run the script again with valid Filename."
fi
            

