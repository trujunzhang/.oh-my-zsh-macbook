#!/usr/bin/env bash

CURRENT=`pwd`
# Folders in Home.


if [[ $(uname -m) == 'arm64' ]]; then
    # echo M2
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"  
fi

if [[ $(uname -m) == 'x86_64' ]]; then
    # echo Mackook
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"
fi

TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"


echo "                         "
echo "=================================================================================="
echo "Bash version ${BASH_VERSION}...           "
echo "                                          "
echo "** CURRENT:                                "
echo "$CURRENT"
echo "** ORGANIZATIONS_HOME:                     "
echo "$ORGANIZATIONS_HOME"
echo "** TRUJUNZHANG_DOTFILES_HOME:              "
echo "$TRUJUNZHANG_DOTFILES_HOME"
echo "=================================================================================="
echo "                                          "

# ====================================================================
# ====================================================================
#          Variables
# ====================================================================
# ====================================================================

# Home(All)
# ======================================
# ORGANIZATIONS_APPLICATION_HOME="$ORGANIZATIONS_HOME/__APPLICATIONS/Applications"

# User's profile
# USERPROFILE_HOME="$ORGANIZATIONS_HOME/__UserProfile"
PATH_USERPROFILE_LIBRARY="$HOME/Library"
PATH_USERPROFILE_APPLICATION_SUPPORT="$HOME/Library/Application Support"


# *Links(Caches)
# ======================================
CACHES_HOME="$ORGANIZATIONS_HOME/__CACHES"
# ==Items==
LIBRARY_YARN_HOME="$CACHES_HOME/Yarn"
LIBRARY_COCOAPODS_HOME="$CACHES_HOME/CocoaPods"



# Trujunzhag's tmux
TMUX_CONFIG="$TRUJUNZHANG_DOTFILES_HOME/tmux.conf.symlink"
TMUX_CONFIG_LOCAL="$TRUJUNZHANG_DOTFILES_HOME/tmux.conf.local.symlink"

# Import function files.
source ./bash/files-functions.sh

# Applications
SYSTEM_APPLICATION="/Applications"


# ====================================================================
# ====================================================================
#         All Links
# ====================================================================
# ====================================================================

function link_applescript {
  # shell that run when os startup.
  fileLink "shellstartup.json"  "$TRUJUNZHANG_DOTFILES_HOME/applescript/system/shellstartup.json" "$HOME/shellstartup.json"

  # plist that run terminal cmds
  fileLink "terminalcmds.plist"  "$TRUJUNZHANG_DOTFILES_HOME/applescript/terminals/terminalcmds.plist" "$HOME/terminalcmds.plist"
}

function link_config_fold {
  directoryLink  "config(kitty)"         "$TRUJUNZHANG_DOTFILES_HOME/config/kitty"             "$HOME/.config/kitty"
  directoryLink  "config(mpv)"           "$TRUJUNZHANG_DOTFILES_HOME/config/mpv"               "$HOME/.config/mpv"
  directoryLink  "config(qutebrowser)"   "$TRUJUNZHANG_DOTFILES_HOME/config/qutebrowser"       "$HOME/.config/qutebrowser"
}

function link_ide_configs {
  ### IDES(HOME)
  ### /Users/djzhang/Library/Application Support/**
  DEST_APPLICATION_SUPPOR="$HOME/Library/Application Support"
  IDES_TRUJUNZHANG_HOME="$TRUJUNZHANG_DOTFILES_HOME/USERS/IDES"
  ### IDES(VSCODE)
  VSCODE_HOME="$IDES_TRUJUNZHANG_HOME/vscode"
  VSCODE_USERS_HOME="$VSCODE_HOME/User"
  ### /Users/djzhang/Library/Application Support/Code/User
  DEST_VSCODE_USER_HOME="$DEST_APPLICATION_SUPPOR/Code/User"
  ### IDES(Atom)
  ATOM_HOME_SOURCE="$IDES_TRUJUNZHANG_HOME/atom"
  ATOM_HOME_DEST="$HOME/.atom"
  ### IDES(Sublime)
  SUBLIME_HOME_SOURCE="$IDES_TRUJUNZHANG_HOME/sublime"
  ### /Users/djzhang/Library/Application\ Support/Sublime\ Text\ /Packages/User
  SUBLIME_SUPPORT_USER="$DEST_APPLICATION_SUPPOR/Sublime Text/Packages/User"


  # IDES(VSCode|Webstorm)
  # https://github.com/VSpaceCode/VSpaceCode
  mkdir "$HOME/Library/Application Support/Code"
  mkdir "$HOME/Library/Application Support/Code/User"
  mkdir "$DEST_VSCODE_USER_HOME/globalStorage/alefragnani.project-manager"
  directoryLink  "snippet(vscode)"     "$VSCODE_USERS_HOME/snippets"           "$DEST_VSCODE_USER_HOME/snippets"
  fileLink "keybindings.json(vscode)"  "$VSCODE_USERS_HOME/keybindings.json"   "$DEST_VSCODE_USER_HOME/keybindings.json"
  fileLink "settings.json(vscode)"     "$VSCODE_USERS_HOME/settings.json"      "$DEST_VSCODE_USER_HOME/settings.json"
  fileLink "projects.json(vscode)"     "$VSCODE_HOME/projects.json"            "$DEST_VSCODE_USER_HOME/globalStorage/alefragnani.project-manager/projects.json"

  # IDES(atom)
  fileLink "config.cson(atom)"    "$ATOM_HOME_SOURCE/config.cson" "$ATOM_HOME_DEST/config.cson"
  fileLink "keymap.cson(atom)"    "$ATOM_HOME_SOURCE/keymap.cson" "$ATOM_HOME_DEST/keymap.cson"
  fileLink "projects.cson(atom)"  "$ATOM_HOME_SOURCE/projects.cson" "$ATOM_HOME_DEST/projects.cson"

  # IDES(Sublime)
  mkdir -p "$SUBLIME_SUPPORT_USER"
  fileLink "Preferences.sublime-settings(sublime)"  "$SUBLIME_HOME_SOURCE/Preferences.sublime-settings" "$SUBLIME_SUPPORT_USER/Preferences.sublime-settings"
  SUBLIME_APP_HOME="$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Sublime Text.app/Contents"
  ln -sv "$SUBLIME_APP_HOME/SharedSupport/bin/subl" "/usr/local/bin/subl"

  # IDES(LightTable)
  LIGHT_TABLE_APP="$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/lighttable/light"
  ln -sv "$LIGHT_TABLE_APP" "/usr/local/bin/light"

  # IDE(Sublime Merge)
  # ln -s "$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge

  # Path
  fileLink   "studio(path)"   "$ORGANIZATIONS_HOME/__APPLICATIONS/BinApps/studio"   "/usr/local/bin/studio"
}

# nginx default site
# directoryLink  "nginx(site)"         "$CACHES_HOME/www"    "/usr/local/var/www"

function link_vim {
  # *Links(dot_vim)
  # ======================================
  VIM_ALL_HOME="$TRUJUNZHANG_DOTFILES_HOME/nicknisi/vim"
  # ==Items==
  DOT_VIM_RC="$VIM_ALL_HOME/init.vim"

  # DOT_VIM
  # directoryLink  "vim(.vim)"         "$VIM_ALL_HOME"    "$HOME/.vim"
  # directoryLink  "neovim(config)"    "$VIM_ALL_HOME"    "$HOME/.config/nvim"
  # fileLink       "vim(.vimrc)"       "$DOT_VIM_RC"      "$HOME/.vimrc"

  # spacevim(All)(pending)
  directoryLink "SpaceVim(git)"            "$ORGANIZATIONS_HOME/IDES/vim-shim/SpaceVim"           "$HOME/.SpaceVim"
  directoryLink "SpaceVim(vim)"            "$ORGANIZATIONS_HOME/IDES/vim-shim/SpaceVim"           "$HOME/.vim"
  directoryLink "SpaceVim(nvim)"           "$ORGANIZATIONS_HOME/IDES/vim-shim/SpaceVim"           "$HOME/.config/nvim"

  directoryLink "SpaceVim.d(UserProfile)"  "$TRUJUNZHANG_DOTFILES_HOME/editors/SpaceVim.d"       "$HOME/.SpaceVim.d"
  # fileLink "gvimrc(MacVim)"                "$TRUJUNZHANG_DOTFILES_HOME/gvimrc.symlink"   "$HOME/.gvimrc"
}

# $USERPROFILE/Library/Caches
# directoryLink  "Caches(Yarn)"       "$LIBRARY_YARN_HOME"         "$HOME/Library/Caches/Yarn"
# directoryLink  "Caches(CocoaPods)"  "$LIBRARY_COCOAPODS_HOME"    "$HOME/Library/Caches/CocoaPods"

# Environment(pyenv)
# directoryLink  "Env(Pyenv)"  "$PYENV_HOME"  "$HOME/.pyenv"

# trujunzhang's profile
# directoryLink  "Application(djzhang)"  "$ORGANIZATIONS_APPLICATION_HOME"  "$HOME/Applications"

function link_symlink {
  # *Links(IDES)
  # ======================================
  IDES_HOME="$ORGANIZATIONS_HOME/IDES"
  # **IDES(chemacs2[emacs-shim])
  EMACS_SHIM_HOME="$IDES_HOME/emacs-shim"
  # **IDES(zsh)
  OH_MY_ZSH_HOME="$IDES_HOME/oh-my-zsh"
  # ==Items==
  OH_MY_ZSH_IDE_HOME="$OH_MY_ZSH_HOME/oh-my-zsh"
  POWER_LEVEL_9K_HOME="$OH_MY_ZSH_HOME/powerlevel9k"
  # **IDES(purcell's emacs.d)
  PURCELL_EMACS_HOME="$TRUJUNZHANG_DOTFILES_HOME/purcell/emacs.d"
  # **IDES(spacemacs)
  SPACEMACS_HOME="$IDES_HOME/spacemacs"
  # ==Items==
  SPACEMACS_IDE_HOME="$SPACEMACS_HOME/spacemacs"
  SPACEMACS_W3M_HOME="$SPACEMACS_HOME/venmos/w3m-layer"
  SPACEMACS_VUE_HOME="$SPACEMACS_HOME/lawrsp/vue-layer"
  ### IDES(cocoapods)
  COCOAPODS_HOME="$IDES_HOME/cocoapods/.cocoapods"
  ### IDES(ENVS)
  ENVS_HOME="$IDES_HOME/ENVS"
  # ==Items==
  # git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  PYENV_HOME="$ENVS_HOME/pyenv"


  # cocoapods(ruby)
  # directoryLink  "cocoapods(respository)"  "$COCOAPODS_HOME"  "$HOME/.cocoapods"

  # .oh-my-zsh
  # directoryLink  "oh-my-zsh(offline)"  "$OH_MY_ZSH_IDE_HOME"  "$HOME/.oh-my-zsh"

  directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/oh-my-zsh/custom/plugins/trujunzhang"    "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"
  # directoryLink  "oh-my-zsh(theme:powerlevel9k)"  "$POWER_LEVEL_9K_HOME"                                             "$HOME/.oh-my-zsh/custom/themes/powerlevel9k"

  # zshrc(rc)
  fileLink ".zsh(env)"  "$TRUJUNZHANG_DOTFILES_HOME/zshenv.symlink" "$HOME/.zshenv"
  fileLink ".zsh(rc)"   "$TRUJUNZHANG_DOTFILES_HOME/zshrc.symlink"  "$HOME/.zshrc"

  # zshrc(theme)
  fileLink ".zsh(powerlevel10k)"  "$TRUJUNZHANG_DOTFILES_HOME/p10k.zsh.symlink" "$HOME/.p10k.zsh"

  # sbcl(common lisp)
  fileLink ".sbcl(common lisp)"   "$TRUJUNZHANG_DOTFILES_HOME/sbclrc.symlink"  "$HOME/.sbclrc"

  # jetbrains's ideavim(config)
  fileLink ".ideavim(config)" "$TRUJUNZHANG_DOTFILES_HOME/ideavimrc.symlink" "$HOME/.ideavimrc"

  # editor(config)
  fileLink ".editor(config)"  "$TRUJUNZHANG_DOTFILES_HOME/editorconfig.symlink" "$HOME/.editorconfig"

  # window management(yabai/skhdrc)
  fileLink ".window(yabai)"  "$TRUJUNZHANG_DOTFILES_HOME/yabairc.symlink" "$HOME/.yabairc"
  fileLink ".window(skhdrc)"  "$TRUJUNZHANG_DOTFILES_HOME/skhdrc.symlink" "$HOME/.skhdrc"

  # git(config)
  fileLink ".git(config)"     "$TRUJUNZHANG_DOTFILES_HOME/gitconfig.symlink" "$HOME/.gitconfig"
  fileLink ".git(global)"     "$TRUJUNZHANG_DOTFILES_HOME/gitignore_global.symlink" "$HOME/.gitignore_global"

  # bash
  fileLink ".bash(profile)"   "$TRUJUNZHANG_DOTFILES_HOME/bash_profile.symlink"  "$HOME/.bash_profile"
  fileLink ".bash(rc)"        "$TRUJUNZHANG_DOTFILES_HOME/bashrc.symlink"  "$HOME/.bashrc"

  directoryLink  "dotenv(Express.js environment variables)"  "$ORGANIZATIONS_HOME/TRUJUNZHANG/dotenv" "$HOME/.dotenv"

  # **IDES(purcell's emacs.d)
  # directoryLink  "purcell(emacs.d)"       "$PURCELL_EMACS_HOME"         "$HOME/.emacs.d"

  # **IDES(chemacs2[emacs-shim])
  # EMACS_SHIM_HOME="$IDES_HOME/emacs-shim"
  # https://github.com/plexus/chemacs2.git
  directoryLink "chemacs2(.emacs.d)"       "$EMACS_SHIM_HOME/chemacs2"                     "$HOME/.emacs.d"
  directoryLink "Doom(.doom.d)"            "$TRUJUNZHANG_DOTFILES_HOME/editors/.doom.d"    "$HOME/.doom.d"
  fileLink "chemacs2(.emacs-profile)"      "$EMACS_SHIM_HOME/.emacs-profile"               "$HOME/.emacs-profile"
  fileLink "chemacs2(.emacs-profiles.el)"  "$TRUJUNZHANG_DOTFILES_HOME/editors/.emacs-profiles.el" "$HOME/.emacs-profiles.el"

  # spacemacs(All)
  # directoryLink  "spacemacs(.emacs.d)"  "$SPACEMACS_IDE_HOME"                          "$HOME/.emacs.d"
  fileLink ".spacemacs(profile)"        "$TRUJUNZHANG_DOTFILES_HOME/spacemacs.symlink" "$HOME/.spacemacs"

  ## spacemacs(plugins)
  # directoryLink "emacs_layout(trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/layers/trujunzhang-workspace"    "$HOME/.emacs.d/private/trujunzhang-workspace"
  # directoryLink "emacs_layout(dart-layer)"   "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/layers/dart-layer"               "$HOME/.emacs.d/private/dart-layer"
  # directoryLink "w3m(third Layout)"          "$SPACEMACS_W3M_HOME"                                                "$HOME/.emacs.d/private/w3m"
  # directoryLink "vue(third Layout)"        "$SPACEMACS_VUE_HOME"                                                "$HOME/.emacs.d/private/vue"
  ## spacemacs(Snippets)
  # directoryLink "emacs(My Snippet)" "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/mySnippets"  "$HOME/.emacs.d/private/mySnippets"


  # Tmux(All)
  # fileLink "tmux(config)"       "$TMUX_CONFIG"          "$HOME/.tmux.conf"
  # fileLink "tmux(config.local)" "$TMUX_CONFIG_LOCAL"    "$HOME/.tmux.conf.local"

  # Android Environment
  # directoryLink "sdk(Android)"       "/Volumes/Data/ALLNew_Macbook/Users/djzhang/Library/Android"   "$HOME/Library/Android"
  # directoryLink ".android(Android)"  "/Volumes/Data/ALLNew_Macbook/Users/djzhang/.android"          "$HOME/.android"
  # directoryLink ".gradle(Android)"   "/Volumes/Data/ALLNew_Macbook/Users/djzhang/.gradle"           "$HOME/.gradle"

  # Node.js
  fileLink "Yarn(config)"       "$TRUJUNZHANG_DOTFILES_HOME/yarnrc.symlink"          "$HOME/.yarnrc"
}

# function link_cocoapods {
  # cocoapods(Repository)
  # mkdir -p "$HOME/.cocoapods/repos/trunk"
  # directoryLink ".cocoapods(Repository)"   "/Volumes/MacDevelop/.cocoapods/Specs/Specs"           "$HOME/.cocoapods/repos/trunk/Specs"

  # cocoapods(Github)
  # directoryLink ".cocoapods(github[@common])"   "/Volumes/MacDevelop/.github/@common"    "$ORGANIZATIONS_HOME/__CACHES/github/@common"   
  # directoryLink ".cocoapods(github[@spec])"   "/Volumes/MacDevelop/.github/@spec"        "$ORGANIZATIONS_HOME/__CACHES/github/@spec"   

  # cocoapods(Cache)
  # directoryLink ".cocoapods(Cache)"   "/Volumes/MacDevelop/.Caches/CocoaPods"           "$HOME/Library/Caches/CocoaPods"
# }

# =============================
# Flutter
# =============================

function link_getx_shell {
  # flutter tool(getx style)
  fileLink "Getx(style)"           "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_style.sh"         /usr/local/bin/getx_style
  chmod +x /usr/local/bin/getx_style

  # flutter tool(getx page)
  fileLink "Getx(page)"             "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_page.sh"         /usr/local/bin/getx_page
  chmod +x /usr/local/bin/getx_page

  # flutter tool(getx page no binding)
  fileLink "Getx(page_no_binding)"  "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_page_no_binding.sh"   /usr/local/bin/getx_page_no_binding
  chmod +x /usr/local/bin/getx_page_no_binding

  # flutter tool(getx widget)
  fileLink "Getx(widget)"            "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_widget.sh"         /usr/local/bin/getx_widget
  chmod +x /usr/local/bin/getx_widget

  # flutter tool(getx rest)
  fileLink "Getx(rest)"              "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_rest.sh"         /usr/local/bin/getx_rest
  chmod +x /usr/local/bin/getx_rest
}

# ======================================
# ios cocoapods for React native
# ======================================

function link_pods_shell {
  fileLink "Cocoapods(offline)"      "$TRUJUNZHANG_DOTFILES_HOME/USERS/cocoapods/offline_local_ios_pods.sh"         /usr/local/bin/offline_local_ios_pods
  chmod +x /usr/local/bin/offline_local_ios_pods
}

# ======================================
# Run custom apps
# ======================================
function link_run_apps_shell {
  fileLink "Apps(custom)"      "$TRUJUNZHANG_DOTFILES_HOME/applescript/system/run_my_apps.sh"         /usr/local/bin/run_my_apps
  chmod +x /usr/local/bin/run_my_apps
}

# Nginx downloads
function link_nginx_http {
  # directoryLink "nginx(Download)"   "$ORGANIZATIONS_HOME/__CACHES/github/@http"     "/usr/local/var/www/@http"
  directoryLink "nginx(Download)"   "$ORGANIZATIONS_HOME/__CACHES/github/@http"       "/opt/homebrew/var/www/@http"
}

function link_mac_user {
  HOME_MAC_USER_PATH="/Volumes/MacUser/djzhang"
  HOME_PROFILE_BACKUP_PATH="/Volumes/MacWork/ProfileBackup"

  # android 
  directoryLink "android(avd)"      "$HOME_PROFILE_BACKUP_PATH/dev-android/.android"           "$HOME_MAC_USER_PATH/.android"
  directoryLink "android(avd)"      "$HOME_PROFILE_BACKUP_PATH/dev-android/Gradle/.gradle"     "$HOME_MAC_USER_PATH/.gradle"
  directoryLink "android(sdk)"      "$HOME_PROFILE_BACKUP_PATH/dev-android/Android"            "$HOME_MAC_USER_PATH/Library/Android"

  # ios
  directoryLink "ios(.cocoapods)"          "$HOME_PROFILE_BACKUP_PATH/dev-ios/.cocoapods"           "$HOME_MAC_USER_PATH/.cocoapods"
  directoryLink "ios(.offline-git)"        "$HOME_PROFILE_BACKUP_PATH/dev-ios/__CACHES"             "$ORGANIZATIONS_HOME/__CACHES"
  directoryLink "ios(Library-Caches)"      "$HOME_PROFILE_BACKUP_PATH/dev-ios/Caches/CocoaPods"     "$PATH_USERPROFILE_LIBRARY/Caches/CocoaPods"

  # org
  directoryLink "org(__APPLICATIONS)"       "$HOME_PROFILE_BACKUP_PATH/org/__APPLICATIONS"        "$ORGANIZATIONS_HOME/__APPLICATIONS"
  directoryLink "org(TRUJUNZHANG)"          "$HOME_PROFILE_BACKUP_PATH/org/TRUJUNZHANG"           "$ORGANIZATIONS_HOME/TRUJUNZHANG"
  directoryLink "org(coding)"               "$HOME_PROFILE_BACKUP_PATH/org/__CODING"              "$ORGANIZATIONS_HOME/__CODING"

  # home
  directoryLink "home(miniforge3)"          "$HOME_PROFILE_BACKUP_PATH/home/miniforge3"            "$HOME_MAC_USER_PATH/miniforge3"

  # Parallels Desktop
  directoryLink "win11(Parallels Desktop)"    "/Volumes/MacGame/VMDesktop/Windows 11.pvm"           "$HOME_MAC_USER_PATH/Parallels/Windows 11.pvm"
}

# mkdir '/usr/local/bin'

# ====================================================================
# ====================================================================
#         All folder
# ====================================================================
# ====================================================================
mkdir -p "$HOME/.local"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.config"


link_applescript
link_config_fold
link_ide_configs
link_vim
link_symlink
# link_cocoapods
link_getx_shell
link_pods_shell
link_run_apps_shell
link_nginx_http
if [[ $(uname -m) == 'arm64' ]]; then
  # echo M2
  link_mac_user
fi






