#!/usr/bin/env bash

source ./bash/shellUtils.sh
source ./bash/games/native-games.sh
source ./bash/games/games-data.sh

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

        my_global_file_name="$game_name"

        check_real_app_name "$game_name"

        app_path="$KegworksGames_Folder/${my_global_file_name}.app"

        if [ -d "$app_path" ]; then
            success "my_global_file_name: ${my_global_file_name}.app"

            game_path="$KegworksGames_Folder/${my_global_file_name}.app/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"
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

        my_global_file_name="$game_name"

        check_real_app_name "$game_name"

        if [ -d "$KegworksGames_Folder/${my_global_file_name}.app" ]; then
            success "my_global_file_name: ${my_global_file_name}.app"

            game_path="$KegworksGames_Folder/${my_global_file_name}.app/$APP_GAME_FOLDER_IN_DRIVER_C/$install_folder_name"

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
