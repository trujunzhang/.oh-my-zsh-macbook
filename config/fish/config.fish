if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
set -g -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -g -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -g -x ANDROID_USER_HOME "$HOME/Library/Android/sdk"
set -g -x REACT_NATIVE_DOWNLOADS_DIR "$HOME/.local/RN_DOWNLOADS"

fish_add_path "$ANDROID_SDK_ROOT"
fish_add_path "$ANDROID_SDK_ROOT/tools"
fish_add_path "$ANDROID_SDK_ROOT/platform-tools"

# djzhang's bin
# ======================================================================
fish_add_path "$HOME/.local/bin" 
fish_add_path "$HOME/Documents/Organizations/__APPLICATIONS/BinApps" 

# environment variable
set -g -x ORGANIZATIONS_HOME "$HOME/Documents/Organizations"

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

# ======================================================================
# java environment
# ======================================================================
 # set up java with jenv 
 # do not set JAVA_HOME here
if [ -d $HOME/.jenv ]
    set PATH $HOME/.jenv/bin $PATH
    eval (jenv init - | source)
end

# set -e JAVA_HOME ( jenv javahome )

# ======================================================================
# Python environment
# ======================================================================
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

if [ -d $HOME/.pyenv ]
    pyenv init - | source
end

# ======================================================================
# finally
# ======================================================================
# Aliases
if [ -f $HOME/.config/fish/functions/trujunzhang.fish ]
  source $HOME/.config/fish/functions/trujunzhang.fish
end

# https://rvm.io/integration/fish
if [ -d $HOME/.rvm ]
   rvm default
end
