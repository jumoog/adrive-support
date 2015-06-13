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
rm -rf cookies.txt
rm -rf out
tmp=$(curl -X POST -c cookies.txt -d "password=${2}" ${1} > out)
url2=$(grep -Po 'https:.*?[.]html' out | head -1)
curl -b cookies.txt -O -J -L $url2
rm -rf cookies.txt
rm -rf out
