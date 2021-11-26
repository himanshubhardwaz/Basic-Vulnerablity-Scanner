#! /bin/bash

echo -n "Enter the file location and name of the httpd.conf: "
read filename

if [[ -f $filename ]]
    then
        export filename=$filename
        bash git_source_code_exposure.sh
        bash remove_server_banner.sh
        bash disable_directory_browser_listing.sh
        bash disable_trace_http_request.sh
        bash http_only_cookie_and_secure_flag.sh
        bash clickjacking.sh
        bash xss_protection.sh
        bash http_one_0.sh
else
        echo -n "File not found pls run the script again with valid Filename."
fi
            

