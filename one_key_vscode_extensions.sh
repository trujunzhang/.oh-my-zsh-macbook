#!/usr/bin/env bash

source ./bash/shellUtils.sh

vsExtensionsArray=(

    # =================================
    # Themes
    # =================================
    "github.github-vscode-theme"
    "dracula-theme.theme-dracula"

    # =================================
    # Projects and Files
    # =================================
    "junv.recent-files"
    "alefragnani.project-manager"

    # =================================
    # Code Wrtite
    # =================================
    "aaron-bond.better-comments"

    # =================================
    # Vim shortcut
    # =================================
    "vscodevim.vim"
    # https://github.com/VSpaceCode/VSpaceCode
    # https://vspacecode.github.io/docs/
    "vspacecode.vspacecode"

    # =================================
    # Tools
    # =================================
    "dzhavat.bracket-pair-toggler"
    "naumovs.color-highlight"
    "donjayamanne.githistory"
    "johnguo.columnpaste"

    # =================================
    # Dev
    # =================================
    "formulahendry.auto-rename-tag"
    "esbenp.prettier-vscode"
    "dbaeumer.vscode-eslint"
    "aaron-bond.better-comments"
    "mikestead.dotenv"
    "ms-vscode.live-server"
    "kisstkondoros.vscode-gutter-preview"
    "pflannery.vscode-versionlens"

    # =================================
    # AI (Chatgpt,CodeWhisperer)
    # =================================
    "easycodeai.chatgpt-gpt4-gpt3-vscode"
    "amazonwebservices.aws-toolkit-vscode"
    # "github.copilot"
    "codeium.codeium"
    # https://www.codium.ai
    # "Codium.codium"

    # =================================
    # Nix
    # =================================
    "jnoortheen.nix-ide"

    # =================================
    # Toml
    # =================================
    "tamasfe.even-better-toml"

    # =================================
    # Node
    # =================================
    # Jest
    # https://itnext.io/debug-your-tests-in-typescript-with-visual-studio-code-911a4cada9cd
    # "kavod-io.vscode-jest-test-adapter"
    "izdt.javascript-unit-test-snippet"
    "orta.vscode-jest"

    # mocha(test)
    # "hbenl.vscode-mocha-test-adapter"

    # =================================
    # Sanity
    # =================================
    "sanity-io.vscode-sanity"
    "hdoro.sanity-snippets"

    # =================================
    # Design
    # =================================
    "figma.figma-vscode-extension"

    # =================================
    # Javascript
    # =================================
    "xabikos.JavaScriptSnippets"

    # =================================
    # lua
    # =================================
    # "sumneko.lua"

    # =================================
    # prisma
    # =================================
    "prisma.prisma"

    # =================================
    # typescript
    # =================================
    "yoavbls.pretty-ts-errors"

    # =================================
    # React
    # =================================
    "expo.vscode-expo-tools"
    "RajdeepChandra.reactnativesnippets"
    "dsznajder.es7-react-js-snippets"
    "jundat95.react-native-snippet"
    "msjsdiag.vscode-react-native"

    # =================================
    # Flutter
    # =================================
    # "Dart-Code.flutter"
    # "Dart-Code.dart-code"
    # "Nash.awesome-flutter-snippets"
    # "alexisvt.flutter-snippets"
    # "hirantha.json-to-dart"

    # =================================
    # Vue
    # =================================
    "octref.vetur"

    # =================================
    # Tailwind
    # =================================
    "bradlc.vscode-tailwindcss"

)

Params=$1

info "${Params}"

## get length of $vsExtentionsArray
len=${#vsExtensionsArray[@]}

function install_vs_extensions {
    for ((i = 0; i < ${#vsExtensionsArray[@]}; i++)); do
        info "                         "
        info "==============================================================="
        info "element $((i + 1)) of ${len} is ${vsExtensionsArray[$i]}"
        info "==============================================================="
        info "                         "

        code --install-extension ${vsExtensionsArray[$i]} "${Params}"
    done
}

# rm -rf "$HOME/.vscode"
install_vs_extensions
