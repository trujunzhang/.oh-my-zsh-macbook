command_exists () {
    type "$1" &> /dev/null ;
}

brew_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

# if command_exists mvim ; then
#     export VISUAL="mvim --nofork"
# fi

# if [ -x /path/to/programname ]; then
#     echo exists
# else
#     echo does not exist
# fi


