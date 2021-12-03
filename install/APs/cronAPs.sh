#!/bin/bash

# Verify IP correct
VAR=`ip -br -4 a sh | grep enp0s3 | awk '{print $3}'`
if [[ ${VAR} != "10.0.2.14/24" ]] ; then
    ip addr add 10.0.2.14/24 dev enp0s3
fi
