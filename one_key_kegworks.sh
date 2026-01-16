#!/usr/bin/env bash

HOME_MACGAME_PATH="/Volumes/MacGame"
APP_GAMES_PATH="$HOME_MACGAME_PATH/AppGames"
Moving_Games_Folder="$HOME_MACGAME_PATH/crossover/kegworks_games"
KegworksGames_Folder="$APP_GAMES_PATH/Kegworks"
APP_GAME_FOLDER_IN_DRIVER_C="Contents/drive_c/Games"

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh

info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** Games_Folder:                                "
info "$Moving_Games_Folder"
info "** kegworks_games_folder:                                "
info "$KegworksGames_Folder"
info "=================================================================================="
info "                                          "

mkdir -p "$Moving_Games_Folder"

games_in_kegworks=(
    "Assassins Creed Syndicate" "Assassins Creed Syndicate"
    "Assassins Creed Mirage" "Assassins Creed Mirage"
    "Assassins Creed Origins" "Assassin's Creed Origins"
    "Ghost of Tsushima" "Ghost of Tsushima DIRECTOR'S CUT"
    "Just Cause 4" "Just Cause 4"
    "Marvel Spider-Man Remastered" "Marvels.Spider.Man.Remastered.v3.618.0.0"
    "The Last of Us Part II" "The Last of Us Part II"
    "Need for Speed Heat" "Need for Speed Heat"
    # "SILENT HILL f" "SILENT HILL f"
    "SILENT HILL 2" "Silent-Hill-2"
    "Horizon Zero Dawn" "Horizon Zero Dawn"
    "Red Dead Redemption 2" "Red Dead Redemption 2 – BUILD 1491.50 + UE UNLOCKER - SteamGG.net"
    "Grand Theft Auto V" "Grand Theft Auto V"
    "Star Wars Jedi Fallen Order" "Jedi Fallen Order"
    "Warcraft 3 The Frozen Throne" "Warcraft 3"
    "Battlefield V" "Battlefield V"
    "Assassins creed rogue" "Assassin's Creed Rogue"
    "Assassins Creed IV Black Flag" "Assassins Creed IV Black Flag"
    "Alone in the Dark" "Alone in the Dark"
    "Kingdom Come Deliverance" "Kingdom Come Deliverance"
    "Assassin Creed Brotherhood" "Assassins Creed - Brotherhood"
    "Assassins Creed Unity" "Assassins Creed - Unity"
    # "" ""
    # "" ""
    # "" ""
    # "" ""
    # "" ""
    # "" ""
    # "" ""
    # "" ""
    # "" ""
)

my_global_result=""

check_app_existed() {
    prefix=$1
    appName=$2
    app_name_prefix="${prefix}_${appName}"
    dash_name="${appName// /_}"
    dash_name_prefix="${prefix}_${dash_name}"

    # info "check_app_existed: $app_name_prefix"
    # info "check_app_existed: $dash_name_prefix"

    if [ -d "$KegworksGames_Folder/${app_name_prefix}.app" ]; then
        my_global_result="$app_name_prefix"
    fi

    if [ -d "$KegworksGames_Folder/${dash_name_prefix}.app" ]; then
        my_global_result="$dash_name_prefix"
    fi
}

moving_game_folder_from_kegworks() {
    info "moving game folder from kegworks"
    install_folder_name=$1
    game_path=$2
    app_path=$3
    tmp_path="$Moving_Games_Folder/$install_folder_name"

    if [ -L "${game_path}" ]; then
        error " game folder is link: $game_path"
    elif [ -d "$game_path" ]; then
        success "  game folder: <<${game_path}>>"
        success "  tmp folder: <<${tmp_path}>>"

        if [ -d "$tmp_path" ]; then
            error " tmp folder is exist: <<$tmp_path>>"
        else
            mv "$game_path" "$tmp_path"
            if [ -d "$tmp_path" ]; then
                success "     run app: <<${app_path}>>"
                open "$app_path"
            fi
        fi
    else
        error " not found game folder: $game_path"
    fi
}

moving_game_to_kegworks() {
    info "moving game to kegworks"
    install_folder_name=$1
    game_path=$2
    tmp_path="$Moving_Games_Folder/$install_folder_name"

    if [ -L "${tmp_path}" ]; then
        error " tmp folder is link: $tmp_path"
    elif [ -d "$tmp_path" ]; then
        success "  game folder: <<${game_path}>>"
        success "  tmp folder: <<${tmp_path}>>"

        if [ -d "$game_path" ]; then
            error " game folder is exist: <<$game_path>>"
        else
            mv "$tmp_path" "$game_path"
        fi
    else
        error " not found tmp folder: $tmp_path"
    fi
}

run_kegworks_games() {
    info "run_kegworks_games:"

    for ((i = 0; i < ${#games_in_kegworks[@]}; i = i + 2)); do
        game_name="${games_in_kegworks[$i + 0]}"
        install_folder_name="${games_in_kegworks[$i + 1]}"

        my_global_result="$game_name"

        check_app_existed "10" "$game_name"
        check_app_existed "whiskey" "$game_name"

        app_path="$KegworksGames_Folder/${my_global_result}.app"

        if [ -d "$app_path" ]; then
            success "my_global_result: ${my_global_result}.app"

            game_path="$KegworksGames_Folder/${my_global_result}.app/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"
            moving_game_folder_from_kegworks "$install_folder_name" "$game_path" "$app_path"
        else
            error "not found game: $game_name"
        fi
    done
}

restore_kegworks_games() {
    info "restore_kegworks_games:"

    for ((i = 0; i < ${#games_in_kegworks[@]}; i = i + 2)); do
        game_name="${games_in_kegworks[$i + 0]}"
        install_folder_name="${games_in_kegworks[$i + 1]}"

        my_global_result="$game_name"

        check_app_existed "10" "$game_name"
        check_app_existed "whiskey" "$game_name"

        if [ -d "$KegworksGames_Folder/${my_global_result}.app" ]; then
            success "my_global_result: ${my_global_result}.app"

            game_path="$KegworksGames_Folder/${my_global_result}.app/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"

            moving_game_to_kegworks "$install_folder_name" "$game_path"
        else
            error "not found game: $game_name"
        fi
    done

}

_help() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

OPTIONS
  run     move all kegworks games to tmp folder, then run it
  restore move all kegworks games from tmp folder
EOF
}

case "$1" in
run)
    if [ "$test_mode" == "test" ]; then
        test_run_native_games
    else
        run_kegworks_games
        run_native_games
    fi
    ;;
restore)
    if [ "$test_mode" == "test" ]; then
        test_restore_native_games
    else
        restore_kegworks_games
        restore_native_games
    fi
    ;;
h)
    _help
    exit 0
    ;;
*)
    _help
    exit 0
    ;;
esac
