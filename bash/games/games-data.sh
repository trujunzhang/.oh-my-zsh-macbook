#!/usr/bin/env bash

HOME_MACGAME_PATH="/Volumes/MacGame"
APP_GAMES_PATH="$HOME_MACGAME_PATH/AppGames"
Moving_Games_Folder="$HOME_MACGAME_PATH/crossover/kegworks_games"
KegworksGames_Folder="$APP_GAMES_PATH/Kegworks"
APP_GAME_FOLDER_IN_DRIVER_C="Contents/drive_c/Games"

games_in_kegworks=(
    "Assassins Creed Syndicate" "Assassins Creed Syndicate"
    "Assassins Creed Mirage" "Assassins Creed Mirage"
    "Assassins Creed Origins" "Assassin's Creed Origins"
    "Ghost of Tsushima" "Ghost of Tsushima DIRECTOR'S CUT"
    "Just Cause 4" "Just Cause 4"
    "Marvel Spider-Man Remastered" "Marvels.Spider.Man.Remastered.v3.618.0.0"
    "The Last of Us Part II" "The Last of Us Part II"
    # "SILENT HILL f" "SILENT HILL f"
    "SILENT HILL 2" "Silent-Hill-2"
    "Horizon Zero Dawn" "Horizon Zero Dawn"
    "Red Dead Redemption 2" "Red Dead Redemption 2 – BUILD 1491.50 + UE UNLOCKER - SteamGG.net"
    "Grand Theft Auto V" "Grand Theft Auto V"
    "Star Wars Jedi Fallen Order" "Jedi Fallen Order"
    "Warcraft 3 The Frozen Throne" "Warcraft 3"
    "Battlefield V" "Battlefield V"
    "Assassins Creed Rogue" "Assassin's Creed Rogue"
    "Assassins Creed IV Black Flag" "Assassins Creed IV Black Flag"
    "Alone in the Dark" "Alone in the Dark"
    "Kingdom Come Deliverance" "Kingdom Come Deliverance"
    "Assassin Creed Brotherhood" "Assassins Creed - Brotherhood"
    "Assassins Creed Unity" "Assassin's Creed Unity Complete Edition"
    "Crysis 3 Remastered" "Crysis 3 Remastered"
    "Need for Speed Heat" "Need for Speed Heat"
    "Need for Speed Payback" "Need for Speed Payback"
    "The Witcher 3" "The Witcher 3"
    "Resident Evil 2" "Resident Evil 2"
    "Resident Evil 3" "Resident Evil 3"
    "Resident Evil 7" "Resident Evil 7"
    "CarX Street" "CarX Street"
    "Far Cry 4" "Far Cry 4"
    "Far Cry 5" "Far Cry 5"
    "Far Cry 6" "Far Cry 6"
    # "" ""
    # "" ""
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

my_global_file_name=""

check_app_existed() {
    prefix=$1
    appName=$2

    app_name_prefix="${prefix}_${appName}"
    dash_name="${appName// /_}"
    dash_name_prefix="${prefix}_${dash_name}"

    # info "check_app_existed: $app_name_prefix"
    # info "check_app_existed: $dash_name_prefix"

    if [ -d "$KegworksGames_Folder/${app_name_prefix}.app" ]; then
        my_global_file_name="$app_name_prefix"
    fi

    if [ -d "$KegworksGames_Folder/${dash_name_prefix}.app" ]; then
        my_global_file_name="$dash_name_prefix"
    fi

    if [ -d "$KegworksGames_Folder/p_${dash_name_prefix}.app" ]; then
        my_global_file_name="p_$dash_name_prefix"
    fi

    # for dxmt
    if [ -d "$KegworksGames_Folder/mt_${dash_name_prefix}.app" ]; then
        my_global_file_name="mt_$dash_name_prefix"
    fi

    if [ -d "$KegworksGames_Folder/p_mt_${dash_name_prefix}.app" ]; then
        my_global_file_name="p_mt_$dash_name_prefix"
    fi
}

check_real_app_name() {
    game_name=$1
    check_app_existed "10" "$game_name"
    check_app_existed "103" "$game_name"
    check_app_existed "108103" "$game_name"
    check_app_existed "2477" "$game_name"
    check_app_existed "whiskey" "$game_name"
}
