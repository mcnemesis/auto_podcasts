#!/usr/bin/sh

#-------- SACRED DUB --------#
# Grab u a perfect collections of esoteric Psychedelic Dub Music
# from the interwebs best producers!
#----------------------------#
# Script created by Nemesis Fixx (https://plus.google.com/u/0/113417329814714254684) #
#----------------------------#

for i in {1..63}
do
    if [ $i -lt 10 ]
    then
        if [ -e "Transmission00$i.mp3" ]
        then
            #if the download still needs to continue...
            if [ -e "Transmission00$i.mp3.st" ]
            then
                axel "http://www.sacreddub.com/podcasts/00$i.mp3" -o "Transmission00$i.mp3"
            fi
            continue
        fi
        axel "http://www.sacreddub.com/podcasts/00$i.mp3" -o "Transmission00$i.mp3"
    else
        if [ -e "Transmission0$i.mp3" ]
        then
            #if the download still needs to continue...
            if [ -e "Transmission0$i.mp3.st" ]
            then
                axel "http://www.sacreddub.com/podcasts/0$i.mp3" -o "Transmission0$i.mp3"
            fi
            continue
        fi
        axel "http://www.sacreddub.com/podcasts/0$i.mp3" -o "Transmission0$i.mp3"
    fi
done
