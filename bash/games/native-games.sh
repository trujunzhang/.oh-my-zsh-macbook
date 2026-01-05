#!/usr/bin/env bash

# test_mode="test"
test_mode="prod"

native_games_apps=(
    # Resident Evil Village
    "Resident Evil Village"
    "*.pak"
    "Contents/Resources"
    "open"

    # MetroExodus
    "MetroExodus"
    "content*"
    "Contents/Resources"
    "ignore"

    # MetroExodus
    "MetroExodus"
    "patch*"
    "Contents/Resources"
    "open"

    # RESIDENT EVIL 7 biohazard
    "RESIDENT EVIL 7 biohazard"
    "re_chunk_*"
    "Contents/Resources"
    "open"
)

test_native_games_apps=(
)

function moving_game_from_source_to_dest() {
    app_name=$1
    pattern=$2
    source_path=$3
    dest_path=$4

    info "Moving game: $app_name"
    info "  pattern: <<${pattern}>>"
    info "  from source: <<${source_path}>>"
    info "  to dest: <<${dest_path}>>"

    if [ -d "$source_path" ]; then
        success " Start to scan folder: <<${source_path}>>"

        for pathname in "${source_path}"/$pattern; do
            if [ -f "$pathname" ]; then
                info "   Start moving to: <<${pathname}>>"
                mv "$pathname" "$dest_path"
            fi
        done
    else
        error "  not found folder: <<$source_path>>"
    fi
}

start_moving_native_games() {
    moving_type=$1
    array=("$@")

    # Get the length of the array
    array_length=${#array[@]}

    # Print the length
    echo "  The array has $array_length elements."
    echo ""

    for ((i = 1; i < ${#array[@]}; i = i + 4)); do
        app_name="${array[$i + 0]}"
        pattern="${array[$i + 1]}"
        sub_folder="${array[$i + 2]}"
        need_run_app="${array[$i + 3]}"

        success "step $i"
        info "  app_name: $app_name"
        info "  pattern: $pattern"
        info "  sub_folder: $sub_folder"
        info "  need_run_app: $need_run_app"
        info ""

        if [ "$moving_type" == "run" ]; then
            source_path="$APP_GAMES_PATH/${app_name}.app/$sub_folder"
            dest_path="$Moving_Games_Folder/$app_name"

            mkdir -p "$dest_path"
        elif [ "$moving_type" == "restore" ]; then
            source_path="$Moving_Games_Folder/$app_name"
            dest_path="$APP_GAMES_PATH/${app_name}.app/$sub_folder"
        fi

        moving_game_from_source_to_dest "$app_name" "$pattern" "$source_path" "$dest_path"

        if [ "$moving_type" == "run" ]; then
            if [ "$need_run_app" == "open" ]; then
                open "$APP_GAMES_PATH/${app_name}.app"
            fi
        fi
    done
}

run_native_games() {
    start_moving_native_games "run" "${native_games_apps[@]}"
}

restore_native_games() {
    start_moving_native_games "restore" "${native_games_apps[@]}"
}

test_run_native_games() {
    start_moving_native_games "run" "${test_native_games_apps[@]}"
}

test_restore_native_games() {
    start_moving_native_games "restore" "${test_native_games_apps[@]}"
}
