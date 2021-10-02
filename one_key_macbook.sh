# Requirements
#   .1 the lastest macos
#   .2 vpn
#   .3 xcode command line tools
#   .4 .oh-my-zsh
#   .5 ./allLinks


# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh


if !command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
fi    


