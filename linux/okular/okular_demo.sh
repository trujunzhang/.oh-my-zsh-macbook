#!/usr/bin/env bash

# file_path="$HOME/.local/state/okular-session/last-pdfs.txt"
# file_path="$HOME/Desktop/okular-session/last-pdfs.txt"

pdf_folder="$HOME/Desktop/lessons"

SESSION_FILE="$file_path"

scan_pdf_folders() {
    contained_string="dj_"

    for pathname in "$pdf_folder"/*; do
        if [ -f "$pathname" ]; then
            if [[ "$pathname" == *"$contained_string"* ]]; then
                document_path="$pathname"
                RESTORED_SESSION+=("$document_path")
            fi
        fi
    done
}

# restore_saved_session() {
#     local document_path=""
#
#     printf "Restoring saved session...\n"
#     printf "Session file: %s\n" "$SESSION_FILE"
#
#     [[ -s "$SESSION_FILE" ]] || return 1
#
#     RESTORED_SESSION=()
#
#     while IFS= read -r document_path; do
#         printf "Restoring: %s\n" "$document_path"
#         [[ -n "$document_path" && -f "$document_path" ]] || continue
#         # is_supported_document_path "$document_path" || continue
#         RESTORED_SESSION+=("$document_path")
#     done <"$SESSION_FILE"
#
#     printf "%s\n" "${RESTORED_SESSION[@]}"
#
#     [[ ${#RESTORED_SESSION[@]} -gt 0 ]] || return 1
# }

run_okular() {
    # /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=okular --file-forwarding org.kde.okular @@u %U @@

    # /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=okular --file-forwarding org.kde.okular "$1"

    launch_args=("${RESTORED_SESSION[@]}")

    /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=okular --file-forwarding org.kde.okular "${launch_args[@]}"

    # flatpak run org.kde.okular --file-forwarding "@$1@"
}

run_okular_xxx() {
    if [[ ${#launch_args[@]} -eq 0 && ${#RESTORED_SESSION[@]} -gt 0 ]]; then
        launch_args=("${RESTORED_SESSION[@]}")
    fi

    # OKULAR_BIN="${OKULAR_BIN:-/usr/bin/okular}"
    OKULAR_BIN=okular

    "$OKULAR_BIN" "${launch_args[@]}"
}

# restore_saved_session
scan_pdf_folders
run_okular
