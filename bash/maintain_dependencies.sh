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
            npx expo install "${library}"
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

function lib_firebase
{
   libs=(
       "@react-native-firebase/app"             "^18.5.0"
       "@react-native-firebase/auth"            "^18.5.0"
       "@react-native-firebase/firestore"       "^18.5.0"

       "@react-native-firebase/analytics"      "^18.5.0"
       "@react-native-firebase/crashlytics"    "^18.5.0"
       "@react-native-firebase/perf"           "^18.5.0"
   )
   install_dependencies "dependencies" "npm" "${libs[@]}"
}

# Expo libraries
lib_expo
# Firebase libraries
# lib_firebase