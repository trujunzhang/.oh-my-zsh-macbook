#!/usr/bin/env bash

HOME_MACGAME_PATH="/Volumes/MacGame"
APP_GAMES_PATH="$HOME_MACGAME_PATH/AppGames"
Moving_Games_Folder="$HOME_MACGAME_PATH/crossover/kegworks_games"
KegworksGames_Folder="$APP_GAMES_PATH/Kegworks"

DRIVER_C_FOLDER_IN_WINE_APP="Contents/drive_c"
DRIVER_C_FOLDER_IN_TOXICGAME_APP="Contents/Resources/ToxicGame/drive_c"

DRIVER_C_FOLDER_IN_CROSSOVER_BOTTLE="drive_c"

GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER="/Volumes/MacUser/djzhang/Documents"

InlineConfigAppInNornal="Contents/Configure.app"
InlineConfigAppInToxicGame="Contents/Resources/Toxic Engine.app"
InlineConfigJsonInToxicGame="Contents/Resources/config.json"

test_games_in_kegworks=(
    "Hogwarts Legacy" "Hogwarts Legacy" "HogwartsLegacy.exe"

    # "Mafia Definitive Edition" "Mafia Definitive Edition" "mafiadefinitiveedition.exe"

    # "Crysis 3 Remastered" "Crysis 3 Remastered" "Bin64\/Crysis3Remastered.exe"

    # "Assassin Creed Brotherhood" "Assassins Creed Brotherhood" "AssassinsCreedBrotherhood.exe"
    # "Assassins Creed III Remastered" "Assassins Creed III Remastered" "ACIII.exe"
    # "Assassins Creed Rogue" "Assassin's Creed Rogue" "ACC.exe"
    # "Assassins Creed Unity" "Assassin's Creed Unity Complete Edition" "ACU.exe"

    # "Assassins Creed IV Black Flag" "Assassins Creed IV Black Flag" "AC4BFSP.exe"

    # Exception on the ToxicGame app version
    # "Need for Speed Payback" "Need for Speed Payback" ""
    # "Resident Evil 7" "Resident Evil 7" ""
    # "FIFA 22" "FIFA 22" ""
)

games_list_in_kegworks=(
    "FIFA 22" "FIFA 22" "FIFA22.exe"
    "Hogwarts Legacy" "Hogwarts Legacy" ""
    "Mafia Definitive Edition" "Mafia Definitive Edition" ""
    "God of War" "God-of-War" ""
    "Assassin Creed Brotherhood" "Assassins Creed Brotherhood" ""
    "Assassins Creed III Remastered" "Assassins Creed III Remastered" ""
    "Assassins Creed IV Black Flag" "Assassins Creed IV Black Flag" "AC4BFSP.exe"
    "Assassins Creed Rogue" "Assassin's Creed Rogue" ""
    "Assassins Creed Unity" "Assassin's Creed Unity Complete Edition" ""
    "Assassins Creed Syndicate" "Assassins Creed Syndicate" ""
    "Assassins Creed Mirage" "Assassins Creed Mirage" ""
    "Assassins Creed Origins" "Assassin's Creed Origins" ""
    "Ghost of Tsushima" "Ghost of Tsushima DIRECTOR'S CUT" ""
    "Just Cause 4" "Just Cause 4" ""
    "Marvel Spider-Man Remastered" "Marvels.Spider.Man.Remastered.v3.618.0.0" ""
    "The Last of Us Part II" "The Last of Us Part II" ""
    # "SILENT HILL f" "SILENT HILL f" ""
    "SILENT HILL 2" "Silent-Hill-2" ""
    "Horizon Zero Dawn" "Horizon Zero Dawn" ""
    "Red Dead Redemption 2" "Red Dead Redemption 2 – BUILD 1491.50 + UE UNLOCKER - SteamGG.net" ""
    "GTA V Enhanced" "Grand Theft Auto V Enhanced" ""
    "Star Wars Jedi Fallen Order" "Jedi Fallen Order" ""
    "Warcraft 3 The Frozen Throne" "Warcraft 3" ""
    "Battlefield V" "Battlefield V" ""
    "Alone in the Dark" "Alone in the Dark" ""
    "Kingdom Come Deliverance" "Kingdom Come Deliverance" ""
    "Crysis 3 Remastered" "Crysis 3 Remastered" ""
    "Need for Speed Heat" "Need for Speed Heat" ""
    "Need for Speed Payback" "Need for Speed Payback" ""
    "The Witcher 3" "The Witcher 3" ""
    "Resident Evil 2" "Resident Evil 2" ""
    "Resident Evil 3" "Resident Evil 3" ""
    "Resident Evil 4" "Resident Evil 4 Remake" ""
    "Resident Evil 7" "Resident Evil 7" ""
    "CarX Street" "CarX Street" ""
    "Far Cry 4" "Far Cry 4" ""
    "Far Cry 5" "Far Cry 5" ""
    "Far Cry 6" "Far Cry 6" ""
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

games_in_kegworks=("${games_list_in_kegworks[@]}")

DEFAULT_GLOBAL_FILE_NAME="not found"
my_global_file_name=""
my_global_file_type=""

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

    name_types=(
        "dx_"
        "p_"
        # for dxmt
        "mt_"
        "dx_p_"
        "dx_mt_"
        "dx_p_mt_"
        "p_mt_"
    )

    for ((m = 0; m < ${#name_types[@]}; m = m + 1)); do
        value=${name_types[$m]}

        if [ -d "$KegworksGames_Folder/${value}${dash_name_prefix}.app" ]; then
            my_global_file_name="${value}$dash_name_prefix"
            my_global_file_type="$value"
        fi
    done
}

check_real_app_name() {
    game_name=$1
    check_app_existed "10" "$game_name"
    check_app_existed "103" "$game_name"
    # check_app_existed "" "$game_name"
    # check_app_existed "" "$game_name"
    # check_app_existed "" "$game_name"
    # check_app_existed "" "$game_name"
    check_app_existed "toxic1113" "$game_name"
    check_app_existed "toxic262" "$game_name"
    check_app_existed "1011x106" "$game_name"
    check_app_existed "2610110" "$game_name"
    check_app_existed "2477" "$game_name"
    check_app_existed "whiskey" "$game_name"
}
