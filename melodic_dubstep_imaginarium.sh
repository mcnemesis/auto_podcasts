#!/usr/bin/sh

#--- Imaginarium Podcase of Melodic Dubstep ---#
# http://podcast.imaginary-i.net/
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
# ./[script-name] 20
#---------------------------------------------------#

#if invoker doesn't tell us which the latest episode is, assume the latest -- 20
LATEST_EPISODE=$((${1:-20}))

DOWNLOAD_URI="http://podcast.imaginary-i.net/files/imaginarium_podcast_!!.mp3"

echo "Assuming Latest Episode to be "$LATEST_EPISODE

for i in $(seq 1 $LATEST_EPISODE)
do
    down_uri=$DOWNLOAD_URI

    index=$i

    if [ $i -lt 10 ]
    then
        index="00"$i
    elif [ $i -lt 100 ]
    then
        index="0"$i
    fi

    down_uri=${down_uri//\!\!/$index}


    if [ -e "imaginarium_podcast_$index.mp3" ]
    then
        #if the download still needs to continue...
        if [ -e "imaginarium_podcast_$index.mp3.st" ]
        then
            echo "Fetching Episode "$index" from : "$down_uri
            axel $down_uri -o "imaginarium_podcast_$index.mp3"
        fi
        #no need to re-download -- already exists here
        continue
    fi

    echo "Fetching Episode "$index" from : "$down_uri
    axel $down_uri -o "imaginarium_podcast_$index.mp3"
done
