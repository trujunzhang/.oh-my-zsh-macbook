#!/usr/bin/env bash

# AwesomeProject/ios/Pods/Local Podspecs


CURRENT=`pwd`

projectPath="${CURRENT}"
echo "                         "
echo "==============================================================="
echo "Bash version ${BASH_VERSION}..."
echo "                         "
echo "$projectPath"
echo "==============================================================="
echo "                         "

# ==========================================================================
# parse a JSON object within a shell script into an array
# https://stackoverflow.com/questions/38364261/parse-json-to-array-in-a-shell-script 
declare -a values # declare the array                                                                                                                                                                  
function parseJson {
    jsonPath=$1

    # Read each line and use regex parsing (with Bash's `=~` operator)
    # to extract the value.
    while read -r line; do
        # Extract the value from between the double quotes
        # and add it to the array.
        [[ $line =~ :[[:blank:]]+\"(.*)\" ]] && values+=( "${BASH_REMATCH[1]}" )
    done < "${jsonPath}"

    # declare -p values # print the array
    # echo "                         "
}

parseJson  "$HOME/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods/config/offline_rn.json"

# echo "array_0=${values[0]}"

# Get the json array's length
json_array_len=${#values[@]}
echo "array_len=${json_array_len}"
echo "                         "
# ==========================================================================

offlineGitFolder="file://$HOME/Documents/Organizations/__CACHES/github"
# offlineHttpFolder='http://localhost:8000/@http'
offlineHttpFolder='http://localhost:8080/@http'

# seq FIRST INCREMENT LAST
for i in $(seq 0 7 $((json_array_len-1)))
do
    enable=${values[$((i+0))]}

    if [ "$enable" = "true" ]; then
        type=${values[$((i+1))]}
        title=${values[$((i+2))]}
        path=${values[$((i+3))]}
        fileName=${values[$((i+4))]}
        # echo "fileName: $fileName"
        podspecJsonPath="${projectPath}/${path}/${fileName}"

        if [ -f "${podspecJsonPath}" ]; then
            echo "                         "
            echo "{podspec json} path: $podspecJsonPath"
            echo "name: $title"

            # Type is 'git'
            if [ "$type" = "git" ]; then
                gitUrl=${values[$((i+5))]}
                echo "gitUrl: $gitUrl"

                gitOfflineFold=${values[$((i+6))]}

                replaceString="${offlineGitFolder}/${gitOfflineFold}"
                echo "git offline fold: $replaceString"

                sed -i '' "s,$gitUrl,$replaceString,g" "${podspecJsonPath}"
            fi

            # Type is 'http'
            if [ "$type" = "http" ]; then
                httpUrl=${values[$((i+5))]}
                echo "httpUrl: $httpUrl"

                httpOfflineFold=${values[$((i+6))]}

                replaceString="${offlineHttpFolder}/${httpOfflineFold}"
                echo "http offline fold: $replaceString"

                sed -i '' "s,$httpUrl,$replaceString,g" "${podspecJsonPath}"
            fi

            echo "                         "
        fi
    fi

done






