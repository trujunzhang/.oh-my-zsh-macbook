#!/bin/bash

# Maintain dependencies script for Expo project
# ============================================
#
# Purpose:
# --------
# This script helps to install all dependencies for Expo project to let running Expo successfully.
#
# How this script helps:
# ----------------------
# This script install all third dependencies that are required for running Expo.

# Use functions and variables from the utils script
source scripts/shellUtils.sh

function install_dependencies
{
    libType=$1
    installType=$2
    dependencies=("$@")

    title "Installing dependencies"

    for (( i=2; i<${#dependencies[@]}; i=i+2 ));
    do
      libName="${dependencies[$i+0]}"
      libVersion="${dependencies[$i+1]}"

      title "lib $i is ${libName}@${libVersion}"

      library="${libName}@${libVersion}"

      if [ "$libType" = "dependencies" ]; then
        if [ "$installType" = "npm" ]; then
            npm install "${library}"
        elif [ "$installType" = "expo" ]; then
            npx expo install "${libName}"
        else
            info "error: installType=${installType}"
        fi
      elif [ "$libType" = "devDependencies" ]; then
        npm install --save-dev "${library}"
      else
        info "error: libType=${libType}"
      fi

    done
}

function lib_expo
{
   libs=(
      "expo-build-properties"   "latest"
   )

   install_dependencies "dependencies" "expo" "${libs[@]}"
}


function lib_tools
{
   libs=(
        "expensify-common" "git+ssh//git@github.com/Expensify/expensify-common.git#ee14b3255da33d2b6924c357f43393251b6dc6d2"
        "@gorhom/portal" "^1.0.14"
        "@kie/act-js" "^2.0.1"
        "@kie/mock-github" "^1.0.0"
        "@types/node" "^18.14.0"
        "@ua/react-native-airship" "^15.2.6"
        "awesome-phonenumber" "^5.4.0"
        "babel-polyfill" "^6.26.0"
        "canvas-size" "^1.2.6"
        "core-js" "^3.32.0"
        "date-fns" "^2.30.0"
        "date-fns-tz" "^2.0.0"
        "dom-serializer" "^0.2.2"
        "domhandler" "^4.3.0"
        "save" "^2.4.0"
        "semver" "^7.5.2"
        "shim-keyboard-event-key" "^1.0.3"
        "underscore" "^1.13.1"
        "fbjs" "^3.0.2"
        "htmlparser2" "^7.2.0"
        "idb-keyval" "^6.2.1"
        "jest-when" "^3.5.2"
        "lodash" "4.17.21"
        "lottie-react-native" "^6.4.0"
        "mapbox-gl" "^2.15.0"
        "onfido-sdk-ui" "13.1.0"
        "patch-package" "^8.0.0"
        "process" "^0.11.10"
        "prop-types" "^15.7.2"
        "pusher-js" "8.3.0"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}


function lib_for_react
{
   libs=(
       "react-beautiful-dnd" "^13.1.1"
        "react-collapse" "^5.1.0"
        "react-content-loader" "^6.1.0"
        "react-dom" "18.1.0"
        "react-error-boundary" "^4.0.11"
        "react-pdf" "^6.2.2"
        "react-plaid-link" "3.3.2"
        "react-web-config" "^1.0.0"
        "react-webcam" "^7.1.1"
        "react-window" "^1.8.9"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_for_react_native
{
   libs=(
        "@shopify/flash-list" "^1.6.1"
        "@dotlottie/react-player" "^1.6.3"
        "@oguzhnatly/react-native-image-manipulator" "githubExpensify/react-native-image-manipulator#5cdae3d4455b03a04c57f50be3863e2fe6c92c52"
        "@onfido/react-native-sdk" "8.3.0"
        "@react-ng/bounds-observer" "^0.2.1"
        "@react-native-async-storage/async-storage" "^1.17.10"
        "@react-native-clipboard/clipboard" "^1.12.1"
        "@react-native-community/geolocation" "^3.0.6"
        "@react-native-community/netinfo" "^9.3.10"
        "react-native-android-location-enabler" "^1.2.2"
        "react-native-blob-util" "^0.17.3"
        "react-native-collapsible" "^1.6.1"
        "react-native-config" "^1.4.5"
        "react-native-dev-menu" "^4.1.1"
        "react-native-device-info" "^10.3.0"
        "react-native-document-picker" "^8.2.1"
        "react-native-draggable-flatlist" "^4.0.1"
        "react-native-fast-image" "^8.6.3"
        "react-native-fs" "^2.20.0"
        "react-native-gesture-handler" "2.12.0"
        "react-native-haptic-feedback" "^1.13.0"
        "react-native-image-pan-zoom" "^2.1.12"
        "react-native-image-size" "git+https//github.com/Expensify/react-native-image-size#8393b7e58df6ff65fd41f60aee8ece8822c91e2b"
        # https://github.com/Expensify/react-native-key-command
        # --- "react-native-key-command" "^1.0.6" // low 'react-native' "^0.70.4" version
        "react-native-linear-gradient" "^2.8.1"
        "react-native-localize" "^2.2.6"
        "react-native-modal" "^13.0.0"
        "react-native-onyx" "1.0.118"
        "react-native-pager-view" "^6.2.0"
        "react-native-pdf" "^6.7.3"
        "react-native-performance" "^5.1.0"
        "react-native-permissions" "^3.9.3"
        "react-native-picker-select" "git+https//github.com/Expensify/react-native-picker-select.git#0d15d4618f58e99c1261921111e68ee85bb3c2a8"
        "react-native-plaid-link-sdk" "10.8.0"
        "react-native-qrcode-svg" "^6.2.0"
        "react-native-quick-sqlite" "^8.0.0-beta.2"
        "react-native-reanimated" "3.5.4"
        "react-native-render-html" "6.3.1"
        "react-native-safe-area-context" "4.4.1"
        "react-native-screens" "3.21.0"
        "react-native-svg" "^13.13.0"
        "react-native-tab-view" "^3.5.2"
        "react-native-url-polyfill" "^2.0.0"
        "react-native-view-shot" "^3.6.0"
        "react-native-web" "^0.19.9"
        "react-native-web-linear-gradient" "^1.1.2"
        "react-native-webview" "^11.17.2"
   )
  #  install_dependencies "dependencies" "npm" "${libs[@]}"

   expoLibs=(
        # https://github.com/mrousavy/react-native-vision-camera
        # https://react-native-vision-camera.com/docs/guides
        # "react-native-vision-camera" "^2.16.2"
        "react-native-vision-camera"     "latest"
   )
   install_dependencies "dependencies" "expo" "${expoLibs[@]}"
}

function lib_firebase
{
   libs=(
       "firebase"                               "^10.7.1"
       "firebase-tools"                         "^13.0.1"

       "@react-native-firebase/app"             "^18.5.0"
       "@react-native-firebase/auth"            "^18.5.0"
       "@react-native-firebase/firestore"       "^18.5.0"

       "@react-native-firebase/analytics"      "^18.5.0"
        # "@react-native-firebase/crashlytics"    "^18.5.0"  // stop, need crash id.
       "@react-native-firebase/perf"           "^18.5.0"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_intl
{
   libs=(
        "@formatjs/intl-datetimeformat"        "^6.10.0"
        "@formatjs/intl-getcanonicallocales"   "^2.2.0"
        "@formatjs/intl-listformat"            "^7.2.2"
        "@formatjs/intl-locale"                "^3.3.0"
        "@formatjs/intl-numberformat"          "^8.5.0"
        "@formatjs/intl-pluralrules"           "^5.2.2"    
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_navigation
{
   libs=(
        "@react-navigation/material-top-tabs"  "^6.6.3"
        "@react-navigation/native"             "6.1.6"
        "@react-navigation/stack"              "6.3.16"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_socials
{
   libs=(
        # for google 
        "@react-native-google-signin/google-signin"        "^10.0.1"
        "@react-oauth/google"                              "^0.12.1"
        # for apple
        "@invertase/react-native-apple-authentication"     "^2.2.2"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_maps
{
   libs=(
        "react-map-gl"                                 "^7.1.3"
        # "@rnmapbox/maps"                               "^10.0.11"
        "react-native-google-places-autocomplete"      "2.5.6"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

function lib_camera_picker
{
   libs=(
        "@react-native-picker/picker" "^2.4.3"
        "@react-native-camera-roll/camera-roll" "5.4.0"
   )

   install_dependencies "dependencies" "npm" "${libs[@]}"

    expoLibs=(
      # --- "react-native-image-picker"       "^5.7.0"    // error
      #  https://docs.expo.dev/tutorial/image-picker/
      "expo-image-picker"       "latest"
   )

   install_dependencies "dependencies" "expo" "${expoLibs[@]}"
}

# =============================================
# dependencies libraries
# =============================================
# lib_expo
# lib_tools
# lib_for_react
# lib_for_react_native
# lib_firebase
# lib_intl
# lib_navigation
# lib_socials
# lib_maps
# lib_camera_picker

function dev_lib_manage_project
{
   libs=(
        "prettier" "^2.8.8"
        "dotenv" "^16.0.3"
        "yaml" "^2.2.1"
        "concurrently" "^5.3.0"
        "shellcheck" "^1.1.0"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_common
{
   libs=(
        "@actions/core" "1.10.0"
        "@actions/github" "5.1.1"
        "@dword-design/eslint-plugin-import-alias" "^4.0.8"
        "@ngneat/falso" "^7.1.1"
        "@octokit/core" "4.0.4"
        "@octokit/plugin-paginate-rest" "3.1.0"
        "@octokit/plugin-throttling" "4.1.0"
        "@react-native-community/eslint-config" "3.0.0"
        "@react-native/metro-config" "^0.72.11"
        "@react-navigation/devtools" "^6.0.10"
        "@trivago/prettier-plugin-sort-imports" "^4.2.0"
        "@vercel/ncc" "0.38.1"
        "@welldone-software/why-did-you-render" "7.0.1"
        "ajv-cli" "^5.0.0"
        "copy-webpack-plugin" "^6.4.1"
        "css-loader" "^6.7.2"
        "diff-so-fancy" "^1.3.0"
        "html-webpack-plugin" "^5.5.0"
        "icon-set-creator" "^1.2.6"
        "memfs" "^4.6.0"
        "onchange" "^7.1.0"
        "portfinder" "^1.0.28"
        "pusher-js-mock" "^0.3.3"
        "react-native-clean-project" "^4.0.0-alpha4.0"
        "react-native-svg-transformer" "^1.0.0"
        "reassure" "^0.10.1"
        "setimmediate" "^1.0.5"
        "style-loader" "^2.0.0"
        "time-analytics-webpack-plugin" "^0.1.17"
        "type-fest" "^3.12.0"
        "wait-port" "^0.2.9"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_babel
{
   libs=(
        "metro-react-native-babel-preset" "0.76.8"

        "@babel/parser" "^7.22.16"
        "@babel/plugin-proposal-class-properties" "^7.12.1"
        "@babel/plugin-proposal-export-namespace-from" "^7.18.9"
        "@babel/preset-env" "^7.20.0"
        "@babel/preset-flow" "^7.12.13"
        "@babel/preset-react" "^7.10.4"
        "@babel/preset-typescript" "^7.21.5"
        "@babel/runtime" "^7.20.0"
        "@babel/traverse" "^7.22.20"
        "@babel/types" "^7.22.19"

        "babel-loader" "^9.1.3"
        "babel-plugin-module-resolver" "^5.0.0"
        "babel-plugin-react-native-web" "^0.18.7"
        "babel-plugin-transform-class-properties" "^6.24.1"
        "babel-plugin-transform-remove-console" "^6.9.4"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}


function dev_lib_for_typescript
{
   libs=(
        "typescript" "^5.1.6"

        "@types/concurrently" "^7.0.0"
        "@types/jest" "^29.5.2"
        "@types/jest-when" "^3.5.2"
        "@types/js-yaml" "^4.0.5"
        "@types/lodash" "^4.14.195"
        "@types/mapbox-gl" "^2.7.13"
        "@types/pusher-js" "^5.1.0"
        "@types/react" "^18.2.12"
        "@types/react-beautiful-dnd" "^13.1.4"
        "@types/react-collapse" "^5.0.1"
        "@types/react-dom" "^18.2.4"
        "@types/react-pdf" "^5.7.2"
        "@types/react-test-renderer" "^18.0.0"
        "@types/semver" "^7.5.4"
        "@types/setimmediate" "^1.0.2"
        "@types/underscore" "^1.11.5"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_eslint
{
   libs=(
        "babel-eslint" "^10.1.0"

        "eslint" "^7.6.0"
        "eslint-config-airbnb-typescript" "^17.1.0"
        "eslint-config-expensify" "^2.0.42"
        "eslint-config-prettier" "^8.8.0"
        "eslint-plugin-jest" "^24.1.0"
        "eslint-plugin-jsdoc" "^46.2.6"
        "eslint-plugin-jsx-a11y" "^6.6.1"
        "eslint-plugin-react-hooks" "^4.6.0"
        "eslint-plugin-react-native-a11y" "^3.3.0"
        "eslint-plugin-storybook" "^0.5.13"
        "eslint-plugin-you-dont-need-lodash-underscore" "^6.12.0"

        "@typescript-eslint/eslint-plugin" "^6.2.1"
        "@typescript-eslint/parser" "^6.2.1"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_test
{
   libs=(
        "babel-jest" "29.4.1"

        "react-test-renderer" "18.2.0"

        "@jest/globals" "^29.5.0"

        "jest" "29.4.1"
        "jest-circus" "29.4.1"
        "jest-cli" "29.4.1"
        "jest-environment-jsdom" "^29.4.1"
        "jest-transformer-svg" "^2.0.1"

        "@testing-library/jest-native" "5.4.1"
        "@testing-library/react-native" "11.5.1"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_electron
{
   libs=(
        "electron" "^25.9.4"
        "electron-builder" "24.6.4"

        "@electron/notarize" "^2.1.0"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_storybook
{
   libs=(
        "@storybook/addon-a11y" "^6.5.9"
        "@storybook/addon-essentials" "^7.0.0"
        "@storybook/addon-react-native-web" "0.0.19--canary.37.cb55428.0"
        "@storybook/addons" "^6.5.9"
        "@storybook/builder-webpack5" "^6.5.10"
        "@storybook/manager-webpack5" "^6.5.10"
        "@storybook/react" "^6.5.9"
        "@storybook/theming" "^6.5.9"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

function dev_lib_web_build
{
   libs=(
        "@svgr/webpack" "^6.0.0"
        "clean-webpack-plugin" "^3.0.0"

        "webpack" "^5.76.0"
        "webpack-bundle-analyzer" "^4.5.0"
        "webpack-cli" "^4.10.0"
        "webpack-dev-server" "^4.9.3"
        "webpack-font-preload-plugin" "^1.5.0"
        "webpack-merge" "^5.8.0"
   )
   install_dependencies "devDependencies" "npm" "${libs[@]}"
}

# =============================================
# devDependencies libraries
# =============================================
dev_lib_manage_project
dev_lib_common
dev_lib_babel
dev_lib_for_typescript
dev_lib_eslint
dev_lib_test
dev_lib_electron
dev_lib_storybook

# npx expo-doctor
# expo doctor --fix-dependencies