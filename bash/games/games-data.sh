#!/usr/bin/env bash

HOME_MACGAME_PATH="/Volumes/MacGame"
APP_GAMES_PATH="$HOME_MACGAME_PATH/AppGames"
Moving_Games_Folder="$HOME_MACGAME_PATH/crossover/kegworks_games"
KegworksGames_Folder="$APP_GAMES_PATH/Kegworks"
KegworksGames_Back_Folder="$APP_GAMES_PATH/xxxx"

DRIVER_C_FOLDER_IN_WINE_APP="Contents/drive_c"
DRIVER_C_FOLDER_IN_TOXICGAME_APP="Contents/Resources/ToxicGame/drive_c"

DRIVER_C_FOLDER_IN_CROSSOVER_BOTTLE="drive_c"

GAME_LINKS_FOLDER_IN_CURRENT_USER_FOLDER="/Volumes/MacUser/djzhang/Documents"

InlineConfigAppInNornal="Contents/Configure.app"
InlineConfigAppInToxicGame="Contents/Resources/Toxic Engine.app"
InlineConfigJsonInToxicGame="Contents/Resources/config.json"

test_games_in_kegworks=(
    # "Warcraft 3 The Frozen Throne" "Warcraft 3" "Warcraft III.exe"

    # "CarX Street" "CarX Street" "CarX Street.exe"

    # "Hogwarts Legacy" "Hogwarts Legacy" "HogwartsLegacy.exe"
    # "Mafia Definitive Edition" "Mafia Definitive Edition" "mafiadefinitiveedition.exe"
    # "Crysis 3 Remastered" "Crysis 3 Remastered" "Bin64\/Crysis3Remastered.exe"

    # "Assassin Creed Brotherhood" "Assassins Creed Brotherhood" "AssassinsCreedBrotherhood.exe"
    "Assassins Creed III Remastered" "Assassins Creed III Remastered" "ACIII.exe"
    # "Assassins Creed Rogue" "Assassin's Creed Rogue" "ACC.exe"
    # "Assassins Creed Unity" "Assassin's Creed Unity Complete Edition" "ACU.exe"
    # "Assassins Creed Revelations" "Assassins Creed Revelations" "ACRSP.exe"
    # "Assassins Creed IV Black Flag" "Assassins Creed IV Black Flag" "AC4BFSP.exe"

    # Exception on the ToxicGame app version
    #"Need for Speed Payback" "Need for Speed Payback" ""
    # "Resident Evil 7" "Resident Evil 7" ""
    #"FIFA 22" "FIFA 22" "FIFA22.exe"
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
    "CarX Street" "CarX Street" "CarX Street.exe"
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

# ${my_global_file_name} without extension '.app'
# ${my_global_file_name} = "1101x1021_FIFA_22"
my_global_file_name=""

check_real_app_name() {
    appName=$1
    dash_name="${appName// /_}"

    for pathname in "${KegworksGames_Folder}"/*; do
        if [ -d "$pathname" ]; then
            FILE=$(basename "$pathname")
            NAME=$(echo "$FILE" | cut -d'.' -f1)
            EXTENSION=$(echo "$FILE" | cut -d'.' -f2)

            if [[ "$FILE" == *"${appName}"* ]]; then
                my_global_file_name=${NAME}
            elif [[ "$FILE" == *"${dash_name}"* ]]; then
                my_global_file_name=${NAME}
            fi
        fi
    done
}

modify_plist_game_config() {
    plist_config_path=$1
    key=$2
    value=$3

    /usr/libexec/PlistBuddy -c "Set :'$key' '$value'" "$plist_config_path"
}

# /usr/libexec/PlistBuddy -c "Set :'Program Name and Path' 'djzhangxxx'" "$HOME/Movies/Info.plist"
