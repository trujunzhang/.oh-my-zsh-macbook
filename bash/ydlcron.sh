# kill -9 $(pgrep youtube-dl)


function  dlist{
    start=$1
    end=$2
    list=$3
    
    echo "                         "
    echo "========================="
    echo " start  $start    "
    echo " end    $end      "
    echo "========================="
    echo "                         "

    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt --playlist-start $start --playlist-end $end $list  
}

cd /home/deploy/data/youtube

# 爱情万万岁 
dlist 25 30 https://www.youtube.com/watch?v=JRrp3b6ZOSM&list=PLRBClVey5Bqz6RG6d5Cc8QJsslWqFx8wG

# 先结婚后恋爱
dlist 31 36 https://www.youtube.com/watch?v=-9MiSYjlrTg&list=PLjjPL6UFQG6qWNHrsD1IsrNK04dCp6zwt

# 我在北京等你
dlist 19 24 https://www.youtube.com/watch?v=SPZZCqcRIJQ&list=PLQqbdnAgoRmZBTuONgIgF9Wkh_9GlTAS0


