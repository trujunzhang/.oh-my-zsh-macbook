#!/usr/bin/env bash

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

# OLD_VERSION="107103"
# OLD_VERSION="108103"
# OLD_VERSION="1010104"
# OLD_VERSION="1011106"
OLD_VERSION="1011x106"
# NEW_VERSION="108103"
NEW_VERSION="2610110"

# 108103_wine
TEMPLATE_WINE_FILE_NAME="${NEW_VERSION}_wine.app"
TEMPLATE_WINE_APP_PATH="$APP_GAMES_PATH/${TEMPLATE_WINE_FILE_NAME}"

DEFAULTVALUE="ready"
# params: 'ready' "update"
Params="${1:-$DEFAULTVALUE}"

info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** OLD_VERSION:                                "
info "$OLD_VERSION"
info "** NEW_VERSION:                                "
info "$NEW_VERSION"
info "** TEMPLATE_FILE_NAME:                                "
info "$TEMPLATE_WINE_FILE_NAME"
info "** TEMPLATE_WINE_APP_PATH:                                "
info "$TEMPLATE_WINE_APP_PATH"
info "=================================================================================="
info "                                          "

check_old_app_name() {
    game_name=$1

    # check_app_existed "10" "$game_name"
    # check_app_existed "103" "$game_name"
    check_app_existed "$OLD_VERSION" "$game_name"
    # check_app_existed "2477" "$game_name"
    # check_app_existed "whiskey" "$game_name"
}

do_when_new_file_exist() {
    install_folder_name=$1
    old_version_file_name=$2
    new_version_file_name=$3
    old_version_app_path=$4
    new_version_app_path=$5

    error "already exist new version game: $new_version_file_name"

    if [ "$Params" = "update" ]; then
        if [ -d "$old_version_app_path" ]; then

            old_game_path="${old_version_app_path}/$DRIVER_C_FOLDER_IN_WINE_APP/Games/$install_folder_name"
            if [ -d "$old_version_app_path/$DRIVER_C_FOLDER_IN_TOXICGAME_APP" ]; then
                old_game_path="${old_version_app_path}/$DRIVER_C_FOLDER_IN_TOXICGAME_APP/Games/$install_folder_name"
            fi

            new_game_path="${new_version_app_path}/$DRIVER_C_FOLDER_IN_WINE_APP/Games/$install_folder_name"
            if [ -d "$new_version_app_path/$DRIVER_C_FOLDER_IN_TOXICGAME_APP" ]; then
                new_game_path="${new_version_app_path}/$DRIVER_C_FOLDER_IN_TOXICGAME_APP/Games/$install_folder_name"
            fi

            if [ -d "$old_game_path" ]; then

                info "     Moving the installed game to new version app: $new_version_file_name"
                info "     old_game_path: $old_game_path"
                info "     new_game_path: $new_game_path"

                if [ -d "$new_game_path" ]; then
                    error "     new_game_path: $new_game_path already exist!"
                elif [ -d "$old_game_path" ]; then
                    info "         Start moving the installed game to new version app: $new_version_file_name"
                    mv "$old_game_path" "$new_game_path"
                else
                    error "     old_game_path: $old_game_path not exist!"
                fi
            fi

        fi
    fi
}

do_when_old_file_exist() {
    old_version_file_name=$1
    new_version_file_name=$2
    old_version_app_path=$3
    new_version_app_path=$4

    success "update game: from $old_version_file_name to $new_version_file_name"

    if [ "$Params" = "$DEFAULTVALUE" ]; then
        if [ -d "$TEMPLATE_WINE_APP_PATH" ]; then
            info "  template app path: $TEMPLATE_WINE_APP_PATH"
            info "  new version app path: $new_version_app_path"

            info "   Copying template app to new version app"

            cp -R "$TEMPLATE_WINE_APP_PATH" "$new_version_app_path"

            open "$new_version_app_path"
        fi
    fi

}

update_wine_games() {
    info "update_wine_games:"

    array=("$@")

    for ((i = 0; i < ${#array[@]}; i = i + 2)); do
        game_name="${array[$i+0]}"
        install_folder_name="${array[$i+1]}"

        # old version file name and path
        my_global_file_name="$game_name"
        check_old_app_name "$game_name"
        old_version_file_name="${my_global_file_name}.app"
        old_version_app_path="$KegworksGames_Folder/${old_version_file_name}"

        # new version file name and path
        new_version_file_name="${old_version_file_name//${OLD_VERSION}/${NEW_VERSION}}"
        new_version_app_path="$KegworksGames_Folder/${new_version_file_name}"

        info "                                          "
        info "** old_version_file_name:                                "
        info "$old_version_file_name"
        info "** old_version_app_path:                                "
        info "$old_version_app_path"
        info "** new_version_file_name:                                "
        info "$new_version_file_name"
        info "** new_version_app_path:                                "
        info "$new_version_app_path"
        info "                                          "

        if [ ! -d "$old_version_app_path" ]; then
            error "not exist old version game: $old_version_file_name"
            continue

        elif [ -d "$new_version_app_path" ]; then
            do_when_new_file_exist "$install_folder_name" "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path"

        elif [ -d "$old_version_app_path" ]; then
            do_when_old_file_exist "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path"

        fi
    done
}

# update_wine_games "${games_in_kegworks[@]}"
update_wine_games "${test_games_in_kegworks[@]}"
