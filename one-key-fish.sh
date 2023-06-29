#!/usr/bin/env bash

# install fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fish_app=(
    "jethrokuan/z"

    "PatrickF1/fzf.fish"

)


for (( i=0; i<${#fish_app[@]}; i++ ));
do
    fisher install ${fish_app[$i]} 
done


