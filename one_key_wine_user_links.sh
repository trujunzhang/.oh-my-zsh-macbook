#!/usr/bin/env bash

# Import function files.
source ./bash/files-functions.sh

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

# NEW_VERSION="108103"
# NEW_VERSION="1011106"
NEW_VERSION="2610110"

# 108103_wine
TEMPLATE_WINE_FILE_NAME="${NEW_VERSION}_wine.app"
TEMPLATE_WINE_APP_PATH="$APP_GAMES_PATH/${TEMPLATE_WINE_FILE_NAME}"

info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** NEW_VERSION:                                "
info "$NEW_VERSION"
info "** TEMPLATE_FILE_NAME:                                "
info "$TEMPLATE_WINE_FILE_NAME"
info "** TEMPLATE_WINE_APP_PATH:                                "
info "$TEMPLATE_WINE_APP_PATH"
info "=================================================================================="
info "                                          "

rename_folder() {
    folderName=$1

    info ""

    if [ -L "$folderName" ]; then
        info "removing linked folder: $folderName"
        rm -rf "$folderName"
    elif [ -d "${folderName}xxx" ]; then
        info "already to be renamed: $folderName"
    elif [ -d "$folderName" ]; then
        info "renaming folder: $folderName"
        mv "$folderName" "${folderName}xxx"
    fi
}

check_and_build_user_links() {
    wine_folder=$1
    driver_c_folder=$2
    app_user=$3

    APP_GAME_FOLDER_IN_DRIVER_C="$driver_c_folder/Games"
    PROGRAMDATA_FOLDER_IN_DRIVER_C="$driver_c_folder/ProgramData"
    USER_FOLDER_IN_DRIVER_C="$driver_c_folder/users"
    APP_USER_FOLDER_IN_DRIVER_C="$USER_FOLDER_IN_DRIVER_C/$app_user"

    # HOME_MACGAME_PATH

    wine_app_path="$HOME_MACGAME_PATH/$wine_folder"

    mkdir -p "$wine_app_path/$APP_GAME_FOLDER_IN_DRIVER_C"

    rename_folder "$wine_app_path/$PROGRAMDATA_FOLDER_IN_DRIVER_C"
    directoryLink "ProgramData" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/ProgramData" "$wine_app_path/$PROGRAMDATA_FOLDER_IN_DRIVER_C"

    rename_folder "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/AppData/Roaming"
    directoryLink "Roaming" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/Games-Roaming" "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/AppData/Roaming"

    rename_folder "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/Saved Games"
    directoryLink "Saved Games" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/Saved-Games" "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/Saved Games"

    rename_folder "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/Documents"
    directoryLink "Documents" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER" "$wine_app_path/$APP_USER_FOLDER_IN_DRIVER_C/Documents"

    rename_folder "$wine_app_path/$USER_FOLDER_IN_DRIVER_C/Public/Documents"
    directoryLink "Public/Documents" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER" "$wine_app_path/$USER_FOLDER_IN_DRIVER_C/Public/Documents"
}

if [ -d "$TEMPLATE_WINE_APP_PATH/${DRIVER_C_FOLDER_IN_WINE_APP}" ]; then
    check_and_build_user_links "AppGames/${TEMPLATE_WINE_FILE_NAME}" "$DRIVER_C_FOLDER_IN_WINE_APP" "Sikarugir"
fi

if [ -d "$TEMPLATE_WINE_APP_PATH/${DRIVER_C_FOLDER_IN_TOXICGAME_APP}" ]; then
    check_and_build_user_links "AppGames/${TEMPLATE_WINE_FILE_NAME}" "$DRIVER_C_FOLDER_IN_TOXICGAME_APP" "crossover"
fi

if [ -d "$HOME_MACGAME_PATH/crossover/d3d-co261win10" ]; then
    check_and_build_user_links "crossover/d3d-co261win10" "$DRIVER_C_FOLDER_IN_CROSSOVER_BOTTLE" "crossover"
fi

if [ -d "$HOME_MACGAME_PATH/crossover/mt-co261win10" ]; then
    check_and_build_user_links "crossover/mt-co261win10" "$DRIVER_C_FOLDER_IN_CROSSOVER_BOTTLE" "crossover"
fi
