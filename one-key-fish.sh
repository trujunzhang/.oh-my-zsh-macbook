#!/usr/bin/env bash

# install fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fish_app=(
    "jorgebucaran/fisher"

    "jethrokuan/z"
    "patrickf1/fzf.fish"
    "jorgebucaran/nvm.fish"
    "budimanjojo/tmux.fish"

    "edc/bass"
)

# fisher install "jorgebucaran/fisher" "jethrokuan/z" "patrickf1/fzf.fish" "jorgebucaran/nvm.fish" "budimanjojo/tmux.fish" "edc/bass"

for (( i=0; i<${#fish_app[@]}; i++ ));
do
    fisher install ${fish_app[$i]} 
done


omf_app=(
    "brew"
    "bobthefish"
)

# omf install  "brew" "bobthefish"

for (( i=0; i<${#omf_app[@]}; i++ ));
do
    omf install ${omf_app[$i]} 
done


