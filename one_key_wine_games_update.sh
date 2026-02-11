#!/usr/bin/env bash

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

OLD_VERSION="107103"
NEW_VERSION="108103"

# 108103_wine
TEMPLATE_WINE_FILE_NAME="${NEW_VERSION}_wine.app"

DEFAULTVALUE="ready"
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
info "$TEMPLATE_FILE_NAME"
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

update_wine_games() {
    info "update_wine_games:"

    for ((i = 0; i < ${#games_in_kegworks[@]}; i = i + 2)); do
        game_name="${games_in_kegworks[$i + 0]}"
        install_folder_name="${games_in_kegworks[$i + 1]}"

        # old version file name and path
        my_global_file_name="$game_name"
        check_old_app_name "$game_name"
        old_version_file_name="${my_global_file_name}.app"
        old_version_app_path="$KegworksGames_Folder/${old_version_file_name}"

        # new version file name and path
        # dash_name="${game_name// /_}"
        # dash_name_prefix="${NEW_VERSION}_${dash_name}"
        new_version_file_name="${old_version_file_name//${OLD_VERSION}/${NEW_VERSION}}"
        new_version_app_path="$KegworksGames_Folder/${new_version_file_name}"

        # info "                                          "
        # info "** old_version_file_name:                                "
        # info "$old_version_file_name"
        # info "** new_version_file_name:                                "
        # info "$new_version_file_name"
        # info "                                          "

        if [ -d "$new_version_app_path" ]; then
            info "already exist new version game: $new_version_file_name"

            if [ "$Params" = "update" ]; then
                if [ -d "$old_version_app_path" ]; then

                    old_game_path="${old_version_app_path}/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"
                    new_game_path="${new_version_app_path}/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"

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

        else
            if [ -d "$old_version_app_path" ]; then
                template_wine_app_path="$APP_GAMES_PATH/${TEMPLATE_WINE_FILE_NAME}"

                success "update game: from $old_version_file_name to $new_version_file_name"

                if [ "$Params" = "$DEFAULTVALUE" ]; then
                    if [ -d "$template_wine_app_path" ]; then
                        info "  template app path: $template_wine_app_path"
                        info "  new version app path: $new_version_app_path"

                        info "   Copying template app to new version app"

                        cp -R "$template_wine_app_path" "$new_version_app_path"

                        open "$new_version_app_path"
                    fi
                fi

            else
                error "not found old version game: $old_version_file_name"
            fi
        fi
    done
}

update_wine_games
