if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export ANDROID_USER_HOME=$HOME/Library/Android/sdk
# export PATH=$ANDROID_SDK_ROOT:$PATH
# export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# djzhang's bin
# ======================================================================
# export PATH="$PATH:$HOME/.local/bin"
fish_add_path "$HOME/.local/bin" 

# environment variable
set -g -x ORGANIZATIONS_HOME "$HOME/Documents/Organizations"

# Aliases
if [ -f $HOME/.config/fish/functions/trujunzhang.fish ]
  source $HOME/.config/fish/functions/trujunzhang.fish
end


# if "$(uname -m)" == 'arm64'  
# end

# switch "$(uname -m)"
#     case "x86_64"
#         echo "wanghao x86_64"
#     case '*'
#         echo I have no idea what a $animal is
# end

# echo "arm macos system! $(uname -m)"
# echo "arm macos system! $(uname)"

# >>> conda initialize >>>
# Refer:
#    https://stackoverflow.com/questions/34280113/add-conda-to-path-in-fish
if [ -f $HOME/miniforge3/bin/conda ]
    eval "$HOME/miniforge3/bin/conda" "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

if type "conda" &> /dev/null 
    conda activate tf_m1
end


