#!/usr/bin/sh

#--- Never Miss HARD with STYLE (By HeadHunterz) ---#
# 
# Script created by Nemesis Fixx (https://plus.google.com/u/0/113417329814714254684) #
#---------------------------------------------------#
#
# NOTE : invoke this script in the same directory where u intend to keep the downloaded 
# Episodes, otherwise, it'll download whatever Episode it thinks you are missing!
#
# Feel free to tell it which episode the latest is, by invoking it with the number of the latest
# episode e.g:
#
# ./never_miss_it.sh 20
#---------------------------------------------------#

#if invoker doesn't tell us which the latest episode is, assume the latest -- 15
LATEST_EPISODE=$((${1:-15}))

DOWNLOAD_URI="http://soundcloud.com/hardwithstyle/episode-!!/download"

echo "Assuming Latest Episode to be "$LATEST_EPISODE

for i in $(seq 1 $LATEST_EPISODE)
do
    down_uri=$DOWNLOAD_URI

    if [ $i -eq 13 ]
    then
        down_uri="http://soundcloud.com/hardwithstyle/show-!!-headhunterz-hard-with/download"
    fi

    down_uri=${down_uri//\!\!/$i}


    if [ -e "HardWithStyle_Episode$i.mp3" ]
    then
        #if the download still needs to continue...
        if [ -e "HardWithStyle_Episode$i.mp3.st" ]
        then
            echo "Fetching Episode "$i" from : "$down_uri
            axel $down_uri -o "HardWithStyle_Episode$i.mp3"
        fi
        #no need to re-download -- already exists here
        continue
    fi

    echo "Fetching Episode "$i" from : "$down_uri
    axel $down_uri -o "HardWithStyle_Episode$i.mp3"
done
