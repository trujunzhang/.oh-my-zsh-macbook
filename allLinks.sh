#!/usr/bin/env bash

# Import function files.
source ./bash/files-functions.sh

source ./bash/shellUtils.sh

CURRENT=$(pwd)
# Folders in Home.

if [[ $(uname -m) == 'arm64' ]]; then
    # info M2
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"
fi

if [[ $(uname -m) == 'x86_64' ]]; then
    # info Mackook
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"
fi

TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"
HOMEBREW_HOME="$(brew --prefix)"

info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** CURRENT:                                "
info "$CURRENT"
info "** ORGANIZATIONS_HOME:                     "
info "$ORGANIZATIONS_HOME"
info "** TRUJUNZHANG_DOTFILES_HOME:              "
info "$TRUJUNZHANG_DOTFILES_HOME"
info "=================================================================================="
info "                                          "

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

# system shell(bin) fold
# SYSTEM_BIN_PATH="/usr/bin"
SYSTEM_BIN_PATH="$HOME/.local/bin"

# Trujunzhag's tmux
TMUX_CONFIG="$TRUJUNZHANG_DOTFILES_HOME/tmux.conf.symlink"
TMUX_CONFIG_LOCAL="$TRUJUNZHANG_DOTFILES_HOME/tmux.conf.local.symlink"

# Applications
SYSTEM_APPLICATION="/Applications"

# ====================================================================
# ====================================================================
#         All Links
# ====================================================================
# ====================================================================

function link_homebrew {
    fileLink "brew(fish)" "$HOMEBREW_HOME/bin/fish" "$SYSTEM_BIN_PATH/fish" "delete"
}

function link_applescript {
    # shell that run when os startup.
    fileLink "shellstartup.json" "$TRUJUNZHANG_DOTFILES_HOME/applescript/system/shellstartup.json" "$HOME/shellstartup.json"

    # plist that run terminal cmds
    fileLink "terminalcmds.plist" "$TRUJUNZHANG_DOTFILES_HOME/applescript/terminals/terminalcmds.plist" "$HOME/terminalcmds.plist"
}

function link_config_fold {
    directoryLink "config(kitty)" "$TRUJUNZHANG_DOTFILES_HOME/config/kitty" "$HOME/.config/kitty"
    directoryLink "config(mpv)" "$TRUJUNZHANG_DOTFILES_HOME/config/mpv" "$HOME/.config/mpv"
    directoryLink "config(qutebrowser)" "$TRUJUNZHANG_DOTFILES_HOME/config/qutebrowser" "$HOME/.config/qutebrowser"

    # SpaceLauncher
    mkdir -p "$PATH_USERPROFILE_APPLICATION_SUPPORT/name.guoc.SpaceLauncher"
    fileLink "config(SpaceLauncher)" "$TRUJUNZHANG_DOTFILES_HOME/config/SpaceLauncher/configuration.json" "$PATH_USERPROFILE_APPLICATION_SUPPORT/name.guoc.SpaceLauncher/configuration.json"

    fileLink "config(tmux.conf)" "$TRUJUNZHANG_DOTFILES_HOME/config/tmux/tmux.conf" "$HOME/.tmux.conf"

    # window management(yabai/skhdrc)
    directoryLink "config(yabai)" "$TRUJUNZHANG_DOTFILES_HOME/config/yabai" "$HOME/.config/yabai"
    directoryLink "config(skhd)" "$TRUJUNZHANG_DOTFILES_HOME/config/skhd" "$HOME/.config/skhd"

    # ruby-bundle
    fileLink "config(bundle)" "$TRUJUNZHANG_DOTFILES_HOME/config/bundle/config" "$HOME/.bundle/config"

    # Maven
    mkdir -p "$HOME/.m2"
    fileLink "config(Maven)" "$TRUJUNZHANG_DOTFILES_HOME/config/maven/settings.xml" "$HOME/.m2/settings.xml"

    # zellij
    directoryLink "config(zellij)" "$TRUJUNZHANG_DOTFILES_HOME/config/zellij" "$HOME/.config/zellij"

    # asdf-vm
    fileLink "config(asdfrc)" "$TRUJUNZHANG_DOTFILES_HOME/config/asdf/.asdfrc" "$HOME/.asdfrc"
    fileLink "config(asdf-node)" "$TRUJUNZHANG_DOTFILES_HOME/config/asdf/.default-npm-packages" "$HOME/.default-npm-packages"
    fileLink "config(asdf-ruby)" "$TRUJUNZHANG_DOTFILES_HOME/config/asdf/.default-gems" "$HOME/.default-gems"

    # nix
    directoryLink "config(nix)" "$TRUJUNZHANG_DOTFILES_HOME/config/nix" "$HOME/.config/nix"

    # nix-darwin
    # rm -rf "$HOME/.config/nix-darwin"
    # cp -Rvp "$TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/$(uname -m)" "$HOME/.config/nix-darwin"

    # nixpkgs
    directoryLink "config(nixpkgs)" "$TRUJUNZHANG_DOTFILES_HOME/config/nixpkgs" "$HOME/.nixpkgs"

    # v2ray-core
    directoryLink "source(v2ray-core)" "$TRUJUNZHANG_DOTFILES_HOME/config/v2ray-core-4.31.0" "$HOME/.config/v2ray-core"

    # zed IDE
    mkdir -p "$HOME/.config/zed"
    fileLink "config(zed-ide)" "$TRUJUNZHANG_DOTFILES_HOME/config/zed/settings.json" "$HOME/.config/zed/settings.json"
    fileLink "config(zed-ide)" "$TRUJUNZHANG_DOTFILES_HOME/config/zed/keymap.json" "$HOME/.config/zed/keymap.json"

    # alacritty
    directoryLink "config(alacritty)" "$TRUJUNZHANG_DOTFILES_HOME/config/alacritty" "$HOME/.config/alacritty"

    # aerospace
    directoryLink "config(alacritty)" "$TRUJUNZHANG_DOTFILES_HOME/config/aerospace" "$HOME/.config/aerospace"

    # sketchybar
    directoryLink "config(sketchybar)" "$TRUJUNZHANG_DOTFILES_HOME/config/sketchybar" "$HOME/.config/sketchybar"

    # wezterm
    directoryLink "config(sketchybar)" "$TRUJUNZHANG_DOTFILES_HOME/config/wezterm" "$HOME/.config/wezterm"

    # quicklisp
    fileLink "quicklisp(rc)" "$TRUJUNZHANG_DOTFILES_HOME/config/quicklisp/sbclrc.symlink" "$HOME/.sbclrc"

    # pip
    fileLink "pip(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/pip/pip.conf" "$HOME/pip.conf"

    # clash
    mkdir -p "$HOME/.config/clash"
    fileLink "clash(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/cloudflare/djzhang.trujunzhang.workers.dev.yaml" "$HOME/.config/clash/config.yaml"

    # nvim-snippet
    directoryLink "nvim(snippets)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvim-snippets" "$HOME/.config/nvim-snippets"

    # lvim
    # directoryLink  "config(lvim)"     "$TRUJUNZHANG_DOTFILES_HOME/config/lvim-abzcoding"       "$HOME/.config/lvim"             "delete"
    # directoryLink  "config(lvim)"     "$TRUJUNZHANG_DOTFILES_HOME/config/lvim-adibhanna"       "$HOME/.config/lvim"             "delete"
    directoryLink "config(lvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/lvim-ChristianChiarulli" "$HOME/.config/lvim" "delete"

    directoryLink "config(lvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/lvim-branch" "$HOME/.local/share/lunarvim/lvim"
    # directoryLink  "config(lvim)"     "$TRUJUNZHANG_DOTFILES_HOME/config/lvim-master"       "$HOME/.local/share/lunarvim/lvim"

    # directoryLink  "config(nvim)"     "$TRUJUNZHANG_DOTFILES_HOME/config/nvim"       "$HOME/.config/nvim/lua/custom"         "delete"
    # directoryLink  "config(nvim)"     "$TRUJUNZHANG_DOTFILES_HOME/config/nvim-BrunoKrugel"       "$HOME/.config/nvim"          "delete"
    # nvim
    directoryLink "config(nvim_lazy)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvim-lazy" "$HOME/.config/nvim" "delete"
    directoryLink "config(nvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvchad-wSedlacek" "$HOME/.config/nvchad-wSedlacek" "delete"
    directoryLink "config(nvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvchad-mgastonportillo" "$HOME/.config/nvchad-mgastonportillo" "delete"
    directoryLink "config(nvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvchad-Alexis12119" "$HOME/.config/nvchad-Alexis12119" "delete"
    directoryLink "config(nvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvim-2kabhishek" "$HOME/.config/nvim-2kabhishek" "delete"
    directoryLink "config(nvim)" "$TRUJUNZHANG_DOTFILES_HOME/config/nvim-craftzdog" "$HOME/.config/nvim-craftzdog" "delete"

    # fish
    #     directoryLink "config(vlc)" "$TRUJUNZHANG_DOTFILES_HOME/config/fish" "$HOME/.config/fish"

    # apps
    directoryLink "config(vlc)" "$TRUJUNZHANG_DOTFILES_HOME/config/vlc" "$HOME/.config/vlc"

    # nginx
    fileLink "config(nginx)" "$TRUJUNZHANG_DOTFILES_HOME/USERS/homebrew/etc/nginx/nginx.conf" "$HOMEBREW_HOME/etc/nginx/nginx.conf" "delete"
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
    mkdir -p "$HOME/Library/Application Support/Code"
    mkdir -p "$HOME/Library/Application Support/Code/User"
    mkdir -p "$DEST_VSCODE_USER_HOME/globalStorage/alefragnani.project-manager"
    directoryLink "snippet(vscode)" "$VSCODE_USERS_HOME/snippets" "$DEST_VSCODE_USER_HOME/snippets"
    fileLink "keybindings.json(vscode)" "$VSCODE_USERS_HOME/keybindings.json" "$DEST_VSCODE_USER_HOME/keybindings.json"
    fileLink "settings.json(vscode)" "$VSCODE_USERS_HOME/settings.json" "$DEST_VSCODE_USER_HOME/settings.json"
    fileLink "projects.json(vscode)" "$VSCODE_HOME/projects.json" "$DEST_VSCODE_USER_HOME/globalStorage/alefragnani.project-manager/projects.json"

    # IDES(atom)
    fileLink "config.cson(atom)" "$ATOM_HOME_SOURCE/config.cson" "$ATOM_HOME_DEST/config.cson"
    fileLink "keymap.cson(atom)" "$ATOM_HOME_SOURCE/keymap.cson" "$ATOM_HOME_DEST/keymap.cson"
    fileLink "projects.cson(atom)" "$ATOM_HOME_SOURCE/projects.cson" "$ATOM_HOME_DEST/projects.cson"

    # IDES(Sublime)
    mkdir -p "$SUBLIME_SUPPORT_USER"
    fileLink "Preferences.sublime-settings(sublime)" "$SUBLIME_HOME_SOURCE/Preferences.sublime-settings" "$SUBLIME_SUPPORT_USER/Preferences.sublime-settings" "delete"
    # SUBLIME_APP_HOME="$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Sublime Text.app/Contents"
    # ln -sv "$SUBLIME_APP_HOME/SharedSupport/bin/subl" "/usr/local/bin/subl"

    # IDES(LightTable)
    # LIGHT_TABLE_APP="$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/lighttable/light"
    # ln -sv "$LIGHT_TABLE_APP" "/usr/local/bin/light"

    # IDE(Sublime Merge)
    # ln -s "$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge

    # Path
    # fileLink   "studio(path)"   "$ORGANIZATIONS_HOME/__APPLICATIONS/BinApps/studio"   "/usr/local/bin/studio"
}

# nginx default site
# directoryLink  "nginx(site)"         "$CACHES_HOME/www"    "/usr/local/var/www"

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

    # .oh-my-fish
    # fileLink  "oh-my-fish(functions:trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/oh-my-zsh/custom/plugins/trujunzhang/trujunzhang.fish"    "$HOME/.config/fish/functions/trujunzhang.fish"   "delete"

    # .oh-my-zsh
    # directoryLink  "oh-my-zsh(offline)"  "$OH_MY_ZSH_IDE_HOME"  "$HOME/.oh-my-zsh"

    directoryLink "oh-my-zsh(plugin:trujunzhang)" "$TRUJUNZHANG_DOTFILES_HOME/oh-my-zsh/custom/plugins/trujunzhang" "$HOME/.oh-my-zsh/custom/plugins/trujunzhang" "delete"
    # directoryLink  "oh-my-zsh(theme:powerlevel9k)"  "$POWER_LEVEL_9K_HOME"                                             "$HOME/.oh-my-zsh/custom/themes/powerlevel9k"

    # zshrc(rc)
    fileLink ".zsh(env)" "$TRUJUNZHANG_DOTFILES_HOME/zshenv.symlink" "$HOME/.zshenv"
    fileLink ".zsh(rc)" "$TRUJUNZHANG_DOTFILES_HOME/zshrc.symlink" "$HOME/.zshrc"

    # zshrc(theme)
    fileLink ".zsh(powerlevel10k)" "$TRUJUNZHANG_DOTFILES_HOME/p10k.zsh.symlink" "$HOME/.p10k.zsh"

    # jetbrains's ideavim(config)
    fileLink ".ideavim(config)" "$TRUJUNZHANG_DOTFILES_HOME/ideavimrc.symlink" "$HOME/.ideavimrc"

    # editor(config)
    fileLink ".editor(config)" "$TRUJUNZHANG_DOTFILES_HOME/editorconfig.symlink" "$HOME/.editorconfig"

    # git(config)
    fileLink ".git(config)" "$TRUJUNZHANG_DOTFILES_HOME/gitconfig.symlink" "$HOME/.gitconfig"
    fileLink ".git(global)" "$TRUJUNZHANG_DOTFILES_HOME/gitignore_global.symlink" "$HOME/.gitignore_global"

    # bash
    fileLink ".bash(profile)" "$TRUJUNZHANG_DOTFILES_HOME/bash_profile.symlink" "$HOME/.bash_profile"
    fileLink ".bash(rc)" "$TRUJUNZHANG_DOTFILES_HOME/bashrc.symlink" "$HOME/.bashrc"

    directoryLink "dotenv(Express.js environment variables)" "$ORGANIZATIONS_HOME/TRUJUNZHANG/dotenv" "$HOME/.dotenv"

    # **IDES(purcell's emacs.d)
    # directoryLink  "purcell(emacs.d)"       "$PURCELL_EMACS_HOME"         "$HOME/.emacs.d"

    # **IDES(chemacs2[emacs-shim])
    # EMACS_SHIM_HOME="$IDES_HOME/emacs-shim"
    # https://github.com/plexus/chemacs2.git
    directoryLink "chemacs2(.emacs.d)" "$EMACS_SHIM_HOME/chemacs2" "$HOME/.emacs.d"
    directoryLink "Doom(.doom.d)" "$TRUJUNZHANG_DOTFILES_HOME/editors/.doom.d" "$HOME/.doom.d"
    fileLink "chemacs2(.emacs-profile)" "$EMACS_SHIM_HOME/.emacs-profile" "$HOME/.emacs-profile"
    fileLink "chemacs2(.emacs-profiles.el)" "$TRUJUNZHANG_DOTFILES_HOME/editors/.emacs-profiles.el" "$HOME/.emacs-profiles.el"

    # spacemacs(All)
    fileLink ".spacemacs(profile)" "$TRUJUNZHANG_DOTFILES_HOME/spacemacs.symlink" "$HOME/.spacemacs"
    directoryLink ".spacemacs(fold)" "$TRUJUNZHANG_DOTFILES_HOME/editors/spacemacs/spacemacs.d" "$HOME/.spacemacs.d"

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
    # fileLink "Yarn(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/yarn/.yarnrc" "$HOME/.yarnrc" "delete"
    directoryLink "npm(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/npm" "$HOME/.config/npm" "delete"
    fileLink "npm(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/npm/npmrc" "$HOME/.npmrc" "delete"
    fileLink "npm(netrc)" "$TRUJUNZHANG_DOTFILES_HOME/config/npm/netrc" "$HOME/.netrc" "delete"

    # GUI.for.SingBox
    directoryLink "SingBox(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/GUI.for.SingBox" "/Users/djzhang/Library/Application Support/GUI.for.SingBox" "delete"

    # GUI.for.clash
    directoryLink "clash(config)" "$TRUJUNZHANG_DOTFILES_HOME/config/GUI.for.Clash" "/Users/djzhang/Library/Application Support/GUI.for.Clash" "delete"
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
    fileLink "Getx(style)" "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_style.sh" "$SYSTEM_BIN_PATH/getx_style"
    chmod +x "$SYSTEM_BIN_PATH/getx_style"

    # flutter tool(getx page)
    fileLink "Getx(page)" "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_page.sh" "$SYSTEM_BIN_PATH/getx_page"
    chmod +x "$SYSTEM_BIN_PATH/getx_page"

    # flutter tool(getx page no binding)
    fileLink "Getx(page_no_binding)" "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_page_no_binding.sh" "$SYSTEM_BIN_PATH/getx_page_no_binding"
    chmod +x "$SYSTEM_BIN_PATH/getx_page_no_binding"

    # flutter tool(getx widget)
    fileLink "Getx(widget)" "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_widget.sh" "$SYSTEM_BIN_PATH/getx_widget"
    chmod +x "$SYSTEM_BIN_PATH/getx_widget"

    # flutter tool(getx rest)
    fileLink "Getx(rest)" "$TRUJUNZHANG_DOTFILES_HOME/bash/flutter/getx_rest.sh" "$SYSTEM_BIN_PATH/getx_rest"
    chmod +x "$SYSTEM_BIN_PATH/getx_rest"
}

# ======================================
# ios cocoapods for React native
# ======================================

function link_pods_shell {
    fileLink "Cocoapods(offline)" "$TRUJUNZHANG_DOTFILES_HOME/USERS/cocoapods/offline_local_ios_pods.sh" "$SYSTEM_BIN_PATH/offline_local_ios_pods"
    chmod +x "$SYSTEM_BIN_PATH/offline_local_ios_pods"
}

# ======================================
# Run custom apps
# ======================================
function link_run_apps_shell {
    fileLink "Apps(custom)" "$TRUJUNZHANG_DOTFILES_HOME/applescript/system/run_my_apps.sh" "$SYSTEM_BIN_PATH/run_my_apps"
    chmod +x "$SYSTEM_BIN_PATH/run_my_apps"
}

# Nginx downloads
function link_nginx_http {
    # directoryLink "nginx(Download)"   "$ORGANIZATIONS_HOME/__CACHES/github/@http"     "/usr/local/var/www/@http"
    directoryLink "nginx(Download)" "$ORGANIZATIONS_HOME/__CACHES/github/@http" "$HOMEBREW_HOME/var/www/@http"
}

function link_mac_app_cloud {
    HOME_ONE_DRIVE_APP_CLOUD="$PATH_USERPROFILE_LIBRARY/CloudStorage/OneDrive-Personal/AppCloud"
    directoryLink "cloud(Pieces.os)" "$HOME_ONE_DRIVE_APP_CLOUD/com.pieces.os" "$PATH_USERPROFILE_LIBRARY/com.pieces.os"
    directoryLink "cloud(Pieces.app)" "$HOME_ONE_DRIVE_APP_CLOUD/com.pieces.pfd" "$PATH_USERPROFILE_LIBRARY/com.pieces.pfd"
}

function link_mac_user {
    HOME_PROFILE_BACKUP_PATH="/Volumes/MacWork/ProfileBackup"
    HOME_MACGAME_PATH="/Volumes/MacGame"
    HOME_MAC_CACHE_PATH="/Volumes/MacGame/MacCache"

    # android
    directoryLink "android(avd-fold)" "/Users/djzhang/.android" "$HOME/.android"
    directoryLink "android(avd)" "$HOME_MAC_CACHE_PATH/.android" "$HOME/.android"

    # directoryLink "android(gradle)"    "/Users/djzhang/.gradle"                                  "$HOME/.gradle"
    # directoryLink "android(gradle)"    "$HOME_PROFILE_BACKUP_PATH/dev-android/Gradle/.gradle"     "$HOME/.gradle"
    directoryLink "android(gradle)" "$HOME_MAC_CACHE_PATH/.gradle" "$HOME/.gradle"

    directoryLink "android(sdk)" "$HOME_MAC_CACHE_PATH/Android" "$HOME/Library/Android"

    # pyenv
    directoryLink "python(env)" "$HOME_MAC_CACHE_PATH/.pyenv" "$HOME/.pyenv"

    # npm(cache)
    directoryLink "npm(cache)" "$HOME_MAC_CACHE_PATH/nvmCaches/.npm" "$HOME/.npm"

    # ios
    # directoryLink "ios(.cocoapods)"          "$HOME_PROFILE_BACKUP_PATH/dev-ios/.cocoapods"           "$HOME/.cocoapods"
    directoryLink "ios(.offline-git)" "$HOME_MAC_CACHE_PATH/__CACHES" "$ORGANIZATIONS_HOME/__CACHES"
    # directoryLink "ios(.offline-git)"        "$HOME_MACMINI_PATH/dev-ios/__CACHES"                    "$ORGANIZATIONS_HOME/__CACHES"
    # directoryLink "ios(Library-Caches)"      "$HOME_PROFILE_BACKUP_PATH/dev-ios/Caches/CocoaPods"     "$PATH_USERPROFILE_LIBRARY/Caches/CocoaPods"

    # home
    directoryLink "home(miniforge3)" "$HOME_PROFILE_BACKUP_PATH/home/miniforge3" "$HOME/miniforge3"

    # Parallels Desktop
    directoryLink "win11(Parallels Desktop)" "$HOME_MACGAME_PATH/VMDesktop/Windows 11.pvm" "$HOME/Parallels/Windows 11.pvm"

    # jenkins
    directoryLink "jenkins(profile)" "$HOME_MACGAME_PATH/.jenkins" "$HOME/.jenkins"
}

# mkdir -p "/usr/local/bin"

# ====================================================================
# ====================================================================
#         All folder
# ====================================================================
# ====================================================================
mkdir -p "$HOME/.local"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config"

link_homebrew
link_applescript
link_config_fold
link_ide_configs
link_symlink
# link_cocoapods
link_getx_shell
link_pods_shell
link_run_apps_shell
link_nginx_http
link_mac_app_cloud
if [[ $(uname -m) == 'arm64' ]]; then
    # info M2
    link_mac_user
fi
