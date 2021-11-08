#!/bin/bash

start=$1
end=$2
list=$3


# for i in {1..22}
# do

#     echo "                         "
#     echo "========================="
#     echo " youtube-dl  $i of 22    "
#     echo "========================="
#     echo "                         "

    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start $start --playlist-end $end $list  &

#     sleep 45s

#    kill -9 $(pgrep youtube-dl)
# done



