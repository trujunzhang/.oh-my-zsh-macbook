#!/usr/bin/env bash

myArray=(
    

    # =================================
    # Tools
    # =================================
    "vscodevim.vim"
    "junv.recent-files"
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
    # Chatgpt
    # =================================
    "easycodeai.chatgpt-gpt4-gpt3-vscode"

    # =================================
    # Node
    # =================================
    # Jest
    # https://itnext.io/debug-your-tests-in-typescript-with-visual-studio-code-911a4cada9cd 
    "kavod-io.vscode-jest-test-adapter"

    # =================================
    # Javascript
    # =================================
    "xabikos.JavaScriptSnippets"

    # =================================
    # React
    # =================================
    "byCedric.vscode-expo"
    "RajdeepChandra.reactnativesnippets"
    "dsznajder.es7-react-js-snippets"
    "jundat95.react-native-snippet"
    "msjsdiag.vscode-react-native"

    # =================================
    # Flutter
    # =================================
    "Dart-Code.flutter"
    "Dart-Code.dart-code"
    "Nash.awesome-flutter-snippets"
    "alexisvt.flutter-snippets"
    "hirantha.json-to-dart"

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

echo "${Params}"

for i in ${!myArray[@]}; do
#   echo "element $i is ${myArray[$i]}"
  code --install-extension ${myArray[$i]} "${Params}"
done
