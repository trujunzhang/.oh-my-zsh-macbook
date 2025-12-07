#!/usr/bin/env bash

CURRENT_USER_DOCUMENTS_PATH="/Volumes/MacUser/djzhang/Documents"
USER_DOCUMENTS_DEFAULT_PATH="/Volumes/MacOS/Users/djzhang/Documents"

function link_games_save_location_path() {
    # Assassin's Creed Origins
    directoryLink "game(Assassin's Creed Origins)" "$CURRENT_USER_DOCUMENTS_PATH/Assassin's Creed Origins" "$USER_DOCUMENTS_DEFAULT_PATH/Assassin's Creed Origins"
    directoryLink "game(Assassin's Creed Origins)" "$CURRENT_USER_DOCUMENTS_PATH/CPY_SAVES" "$USER_DOCUMENTS_DEFAULT_PATH/CPY_SAVES"

    # Assassin's Creed Mirage
    directoryLink "game(Assassin's Creed Mirage)" "$CURRENT_USER_DOCUMENTS_PATH/Assassin's Creed Mirage" "$USER_DOCUMENTS_DEFAULT_PATH/Assassin's Creed Mirage"

    # Ghost of Tsushima DIRECTOR'S CUT
    directoryLink "game(Ghost of Tsushima DIRECTOR'S CUT)" "$CURRENT_USER_DOCUMENTS_PATH/Ghost of Tsushima DIRECTOR'S CUT" "$USER_DOCUMENTS_DEFAULT_PATH/Ghost of Tsushima DIRECTOR'S CUT"

    # Marvel's Spider-Man Remastered
    directoryLink "game(Marvel's Spider-Man Remastered)" "$CURRENT_USER_DOCUMENTS_PATH/Marvel's Spider-Man Remastered" "$USER_DOCUMENTS_DEFAULT_PATH/Marvel's Spider-Man Remastered"

    # The Last of Us Part II
    directoryLink "game(The Last of Us Part II)" "$CURRENT_USER_DOCUMENTS_PATH/The Last of Us Part II" "$USER_DOCUMENTS_DEFAULT_PATH/The Last of Us Part II"

    # Red Dead Redemption 2
    directoryLink "game(Red Dead Redemption 2)" "$CURRENT_USER_DOCUMENTS_PATH/Rockstar Games" "$USER_DOCUMENTS_DEFAULT_PATH/Rockstar Games"

    # My Games
    # Mafia II Definitive Edition
    directoryLink "game(My Games)" "$CURRENT_USER_DOCUMENTS_PATH/My Games" "$USER_DOCUMENTS_DEFAULT_PATH/My Games"

    # Need for Speed Heat
    directoryLink "game(Need for Speed Heat)" "$CURRENT_USER_DOCUMENTS_PATH/Need for Speed Heat" "$USER_DOCUMENTS_DEFAULT_PATH/Need for Speed Heat"

    # Square Enix(Just Cause 4)
    directoryLink "game(Square Enix)" "$CURRENT_USER_DOCUMENTS_PATH/Square Enix" "$USER_DOCUMENTS_DEFAULT_PATH/Square Enix"
}

#
# directoryLink "game()" "$CURRENT_USER_DOCUMENTS_PATH/" "$USER_DOCUMENTS_DEFAULT_PATH/"

#
# directoryLink "game()" "$CURRENT_USER_DOCUMENTS_PATH/" "$USER_DOCUMENTS_DEFAULT_PATH/"
