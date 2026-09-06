#!/usr/bin/env bash

file_path="$HOME/.local/state/okular-session/last-pdfs.txt"
# file_path="$HOME/Desktop/okular-session/last-pdfs.txt"

SESSION_FILE="$file_path"

is_supported_document_path() {
    local document_path="${1% (deleted)}"
    local lower_path="${document_path,,}"
    local extension=""

    [[ -n "$document_path" ]] || return 1

    for extension in "${SUPPORTED_EXTENSIONS[@]}"; do
        if [[ "$lower_path" == *."$extension" ]]; then
            return 0
        fi
    done

    return 1
}

restore_saved_session() {
    local document_path=""

    printf "Restoring saved session...\n"
    printf "Session file: %s\n" "$SESSION_FILE"

    [[ -s "$SESSION_FILE" ]] || return 1

    RESTORED_SESSION=()

    while IFS= read -r document_path; do
        printf "Restoring: %s\n" "$document_path"
        [[ -n "$document_path" && -f "$document_path" ]] || continue
        is_supported_document_path "$document_path" || continue
        RESTORED_SESSION+=("$document_path")
    done <"$SESSION_FILE"

    printf "%s\n" "${RESTORED_SESSION[@]}"

    [[ ${#RESTORED_SESSION[@]} -gt 0 ]] || return 1
}

okular() {
    flatpak run org.kde.okular --file-forwarding "@$1@"
}

run_okular() {
    if [[ ${#launch_args[@]} -eq 0 && ${#RESTORED_SESSION[@]} -gt 0 ]]; then
        launch_args=("${RESTORED_SESSION[@]}")
    fi

    # OKULAR_BIN="${OKULAR_BIN:-/usr/bin/okular}"
    OKULAR_BIN=okular

    "$OKULAR_BIN" "${launch_args[@]}" &
    okular_pid=$!
}

restore_saved_session
run_okular
