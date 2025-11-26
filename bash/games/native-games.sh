#!/usr/bin/env bash

app_resident_evil_village_name="Resident Evil Village"
app_resident_evil_village_path="$APP_GAMES_PATH/${app_resident_evil_village_name}.app"
app_resident_evil_village_resource_path="$app_resident_evil_village_path/Contents/Resources"
app_resident_evil_village_tmp_path="$Moving_Games_Folder/$app_resident_evil_village_name"

function run_Resident_Evil_Village() {
    info "moving game: $app_resident_evil_village_name"
    if [ -d "$app_resident_evil_village_path" ]; then
        success "  game folder: <<${app_resident_evil_village_resource_path}>>"
        mkdir -p "$app_resident_evil_village_tmp_path"

        for pathname in "${app_resident_evil_village_resource_path}"/*.pak; do
            if [ -f "$pathname" ]; then
                info "   moving to: <<${pathname}>>"
                mv "$pathname" "$app_resident_evil_village_tmp_path"
            fi
        done

        open "$app_resident_evil_village_path"

    else
        error "  not found: <<$app_resident_evil_village_path>>"
    fi
}

function restore_Resident_Evil_Village() {
    info "restoring game: $app_resident_evil_village_name"
    if [ -d "$app_resident_evil_village_tmp_path" ]; then
        success "  game folder: <<${app_resident_evil_village_tmp_path}>>"

        for pathname in "${app_resident_evil_village_tmp_path}"/*.pak; do
            if [ -f "$pathname" ]; then
                info "   restoring to: <<${pathname}>>"
                mv "$pathname" "$app_resident_evil_village_resource_path"
            fi
        done
    else
        error "  not found: <<$app_resident_evil_village_tmp_path>>"
    fi
}

run_native_games() {
    run_Resident_Evil_Village
}

restore_native_games() {
    restore_Resident_Evil_Village
}
