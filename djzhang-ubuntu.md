####
   Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)


* Oh My Zsh
   $ sudo apt install zsh
   $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/themes


* zip a folder in Ubuntu Linux using the cli
    $ sudo apt install zip unzip
    $ zip -r filename.zip folder


* youtube_dl
   https://github.com/ytdl-org/youtube-dl
   https://ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/

    $ sudo apt install ffmpeg

    $ youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt
    $ youtube-dl -f 'bestvideo+bestaudio[ext=m4a]'
    $ youtube-dl -f best https://www.youtube.com/watch?v=
    $ youtube-dl -f 315 https://www.youtube.com/watch?v=
    
    Cmd on the vps
      alias ydl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --write-auto-sub --convert-subs=srt"



   Run with -F to see available formats:
    $ youtube-dl -F https://www.youtube.com/watch?v=

   Get subtitles from Youtube in SRT format
    $ youtube-dl --write-auto-sub --convert-subs=srt -f best https://www.youtube.com/watch?v=
   
   Merge MP4 with M4A
    $ ffmpeg -i video.mp4 -i audio.m4a -acodec copy -vcodec copy output.mp4  
