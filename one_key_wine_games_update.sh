#!/usr/bin/env bash

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

# OLD_VERSION="107103"
# OLD_VERSION="108103"
# OLD_VERSION="1010104"
# OLD_VERSION="1011106"
# OLD_VERSION="1011x106"
OLD_VERSION="toxic262"
# NEW_VERSION="108103"
# NEW_VERSION="toxic262"
NEW_VERSION="toxic1113"

# 108103_wine
TEMPLATE_WINE_FILE_NAME="toxic1113.app"
TEMPLATE_WINE_APP_PATH="$APP_GAMES_PATH/${TEMPLATE_WINE_FILE_NAME}"

DEFAULTVALUE="ready"
# params: 'ready' "update"
Params="${1:-$DEFAULTVALUE}"

info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** OLD VERSION:              $OLD_VERSION                        "
info "** NEW VERSION:              $NEW_VERSION                        "
info "** TEMPLATE FILE NAME:       $TEMPLATE_WINE_FILE_NAME            "
info "** TEMPLATE WINE APP PATH:   $TEMPLATE_WINE_APP_PATH                  "
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

OpenWineInlineConfigApp() {
    gameAppPath=$1

    normalConfigApp="${gameAppPath}/${InlineConfigAppInNornal}"
    toxicConfigApp="${gameAppPath}/${InlineConfigAppInToxicGame}"

    if [ -d "$normalConfigApp" ]; then
        info "  Open WineInline Config App: $normalConfigApp"
        open "$normalConfigApp"
    elif [ -d "$toxicConfigApp" ]; then
        info "  Open ToxicInline Config App: $toxicConfigApp"
        open "$toxicConfigApp"
    fi
}

do_when_new_file_exist() {
    install_folder_name=$1
    old_version_file_name=$2
    new_version_file_name=$3
    old_version_app_path=$4
    new_version_app_path=$5
    game_exe_name=$6

    success " [info] already exist new version game: $new_version_file_name"

    if [ -d "$old_version_app_path" ]; then

        old_game_path="${old_version_app_path}/$DRIVER_C_FOLDER_IN_WINE_APP/Games/$install_folder_name"
        if [ -d "$old_version_app_path/$DRIVER_C_FOLDER_IN_TOXICGAME_APP" ]; then
            old_game_path="${old_version_app_path}/$DRIVER_C_FOLDER_IN_TOXICGAME_APP/Games/$install_folder_name"
        fi

        new_game_path="${new_version_app_path}/$DRIVER_C_FOLDER_IN_WINE_APP/Games/$install_folder_name"
        if [ -d "$new_version_app_path/$DRIVER_C_FOLDER_IN_TOXICGAME_APP" ]; then
            new_game_path="${new_version_app_path}/$DRIVER_C_FOLDER_IN_TOXICGAME_APP/Games/$install_folder_name"
        fi

        if [ -d "$new_game_path" ]; then
            error "     new game path: '$new_game_path' already exist!"
        elif [ -d "$old_game_path" ]; then
            info "  [info]   Moving the installed game to new version app: $new_version_file_name"
            info "  [info]   old_game_path: $old_game_path"
            info "  [info]   new_game_path: $new_game_path"

            info "         Start moving the installed game to new version app: $new_version_file_name"
            mv "$old_game_path" "$new_game_path"
        else
            error "     old_game_path: $old_game_path not exist!"
        fi

    fi
}

do_when_old_file_exist() {
    install_folder_name=$1
    old_version_file_name=$2
    new_version_file_name=$3
    old_version_app_path=$4
    new_version_app_path=$5
    game_exe_name=$6

    success "Updating game: from $old_version_file_name to $new_version_file_name"

    if [ -d "$TEMPLATE_WINE_APP_PATH" ]; then
        info "[info]  Template app path:    $TEMPLATE_WINE_APP_PATH"
        info "[info]  New version app path: $new_version_app_path"

        info "    Copying template app to new version app"

        cp -R "$TEMPLATE_WINE_APP_PATH" "$new_version_app_path"

        OpenWineInlineConfigApp "$new_version_app_path"

        sleep 80

        do_when_new_file_exist "$install_folder_name" "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path"

        toxicConfigApp="${new_version_app_path}/${InlineConfigAppInToxicGame}"
        if [ -d "$toxicConfigApp" ]; then
            write_game_exe_file_to_config_file "$install_folder_name" "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path" "$game_exe_name"
        fi

    else
        echo
        error "   [error]  new version app:'${new_version_file_name}' not exist!"
    fi
}

write_game_exe_file_to_config_file() {
    install_folder_name=$1
    old_version_file_name=$2
    new_version_file_name=$3
    old_version_app_path=$4
    new_version_app_path=$5
    game_exe_name=$6

    sleep 5
    killall launcher
    sleep 10

    toxicConfigJson="${new_version_app_path}/${InlineConfigJsonInToxicGame}"

    # "exe_path" : "ToxicGame\/drive_c\/Games\/Assassins Creed IV Black Flag\/AC4BFSP.exe",
    # "exe_path" : "ToxicGame\/drive_c\/Games\/Assassins Creed IV Black Flag\/AC4BFSP.exe",
    # "backend" : "dxmt",
    # "backend" : "dxmt",

    node -e "let pkg=require('${toxicConfigJson}'); pkg['exe_path'] = 'ToxicGame\/drive_c\/Games\/${install_folder_name}\/${game_exe_name}'; require('fs').writeFileSync('${toxicConfigJson}', JSON.stringify(pkg, null, 2));"
}

update_wine_games() {
    info "update wine games:"

    array=("$@")

    for ((i = 0; i < ${#array[@]}; i = i + 3)); do
        game_name="${array[$i + 0]}"
        install_folder_name="${array[$i + 1]}"
        game_exe_name="${array[$i + 2]}"

        # old version file name and path
        my_global_file_name="$game_name"
        check_old_app_name "$game_name"
        old_version_file_name="${my_global_file_name}.app"
        old_version_app_path="$KegworksGames_Folder/${old_version_file_name}"

        # new version file name and path
        new_version_file_name="${old_version_file_name//${OLD_VERSION}/${NEW_VERSION}}"
        new_version_app_path="$KegworksGames_Folder/${new_version_file_name}"

        echo
        info "  =========                                        "
        info "** old version file name:         $old_version_file_name                       "
        info "** old version app path:          $old_version_app_path                       "
        info "** new version file name:         $new_version_file_name                       "
        info "** new version app path:          $new_version_app_path                       "
        info "                                          "

        if [ ! -d "$old_version_app_path" ]; then
            error "not exist old version game: $old_version_file_name"
            continue

        elif [ -d "$new_version_app_path" ]; then
            do_when_new_file_exist "$install_folder_name" "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path" "$game_exe_name"
        elif [ -d "$old_version_app_path" ]; then
            do_when_old_file_exist "$install_folder_name" "$old_version_file_name" "$new_version_file_name" "$old_version_app_path" "$new_version_app_path" "$game_exe_name"
        fi
    done
}

# update_wine_games "${games_in_kegworks[@]}"
update_wine_games "${test_games_in_kegworks[@]}"
