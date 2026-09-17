#!/usr/bin/env bash

pdf_folder="$HOME/Desktop/lessons"

walk_dir() {
    shopt -s globstar
    contained_string="dj_"

    for pathname in "$1"/*; do
        if [ -d "$pathname" ]; then
            walk_dir "$pathname"
        elif [ -f "$pathname" ]; then
            if [[ "$pathname" == *"$contained_string"* ]]; then
                document_path="$pathname"
                RESTORED_SESSION+=("$document_path")
            fi
        fi
    done
}

scan_pdf_folders() {
    walk_dir "$pdf_folder"
}

run_okular() {
    launch_args=("${RESTORED_SESSION[@]}")
    /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=okular --file-forwarding org.kde.okular "${launch_args[@]}" &
}

scan_pdf_folders
run_okular
