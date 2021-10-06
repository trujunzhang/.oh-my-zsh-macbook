#!/bin/bash

start=$1
end=$2
list=$3

youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start '$start' --playlist-end '$end' '$list'
