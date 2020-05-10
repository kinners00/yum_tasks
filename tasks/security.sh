#!/bin/bash

#Variables containing output messages
full='*******Full security update running*******'
minimal='*******Minimal security update running*******'
updatecache='*******Updating Cache*******'
cleancache='*******Cleaning Cache*******'


#Checking cache input to determine which type of cache action to perform
#cache: [update, clean]
if [[ "$PT_cache" == "update" ]]; then
    echo -e "\n$updatecache\n"
    /usr/bin/yum clean expire-cache
    echo ""
elif [[ "$PT_cache" == "clean" ]]; then
    echo -e "\n$cleancache\n"
    /usr/bin/yum clean all
    echo ""
    fi

#Checking securitytype input to determine which type of security update to run
#security: [minimal, full]
if [[ "$PT_security" == "full" ]]; then
    echo -e "$full\n"
    /usr/bin/yum update -y --security
    echo ""
elif [[ "$PT_security" == "minimal" ]]; then 
    echo -e "$minimal\n"
    /usr/bin/yum update-minimal -y --security
    echo ""
    fi
