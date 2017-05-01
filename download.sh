#!/bin/bash
# Very basic ADrive Downloader
red=`tput setaf 3`
green=`tput setaf 2`
reset=`tput sgr0`
if [ $# -eq 0 ]
  then
    echo ${red}"ADrive Downloader for password protected files"
    echo ${red}"Usage:"
    echo ${red}"   download.sh ${green}url password${reset}"
    exit
fi
# create a tmp file
cookie=$(mktemp)
# extract cookie and url
tmp=$(curl -X POST -c ${cookie} -s -d "password=${2}" ${1} | grep -Eo 'https:.*?[.]html' | uniq)
# download the file
curl -b ${cookie} -O -J -L $tmp
# remove the cookie
rm -rf $cookie
