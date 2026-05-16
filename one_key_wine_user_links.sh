#!/usr/bin/env bash

# Import function files.
source ./bash/files-functions.sh

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

# NEW_VERSION="108103"
NEW_VERSION="1011106"

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

    if [ -d "${folderName}xxx" ]; then
        info "already to be renamed: $folderName"
    elif [ -d "$folderName" ]; then
        info "rename_folder: $folderName"
        mv "$folderName" "${folderName}xxx"
    fi
}

check_and_build_user_links() {
    mkdir -p "$TEMPLATE_WINE_APP_PATH/$APP_GAME_FOLDER_IN_DRIVER_C"

    rename_folder "$TEMPLATE_WINE_APP_PATH/$PROGRAMDATA_FOLDER_IN_DRIVER_C"
    directoryLink "ProgramData" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/ProgramData" "$TEMPLATE_WINE_APP_PATH/$PROGRAMDATA_FOLDER_IN_DRIVER_C"

    rename_folder "$TEMPLATE_WINE_APP_PATH/$USER_SIKARUGIR_FOLDER_IN_DRIVER_C/AppData/Roaming"
    directoryLink "Roaming" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/Games-Roaming" "$TEMPLATE_WINE_APP_PATH/$USER_SIKARUGIR_FOLDER_IN_DRIVER_C/AppData/Roaming"

    rename_folder "$TEMPLATE_WINE_APP_PATH/$USER_SIKARUGIR_FOLDER_IN_DRIVER_C/Saved Games"
    directoryLink "Saved Games" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER/Saved-Games" "$TEMPLATE_WINE_APP_PATH/$USER_SIKARUGIR_FOLDER_IN_DRIVER_C/Saved Games"

    rename_folder "$TEMPLATE_WINE_APP_PATH/$USER_FOLDER_IN_DRIVER_C/Public/Documents"
    directoryLink "Documents" "$GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER" "$TEMPLATE_WINE_APP_PATH/$USER_FOLDER_IN_DRIVER_C/Public/Documents"
}

check_and_build_user_links
