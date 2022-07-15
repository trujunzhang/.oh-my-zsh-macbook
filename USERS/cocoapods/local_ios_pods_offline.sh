#!/usr/bin/env bash

echo "Bash version ${BASH_VERSION}..."

CURRENT=`pwd`

projectPath="${CURRENT}"
echo "                         "
echo "========================="
echo "$projectPath"
echo "========================="
echo "                         "


# ==========================================================================
# parse a JSON object within a shell script into an array
# https://stackoverflow.com/questions/38364261/parse-json-to-array-in-a-shell-script 
declare -a values # declare the array                                                                                                                                                                  

# Read each line and use regex parsing (with Bash's `=~` operator)
# to extract the value.
while read -r line; do
    # Extract the value from between the double quotes
    # and add it to the array.
    [[ $line =~ :[[:blank:]]+\"(.*)\" ]] && values+=( "${BASH_REMATCH[1]}" )
done <"/Users/djzhang/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods/config/offline.json"

# declare -p values # print the array

echo "array_0=${values[0]}"

json_array_len=${#values[@]}

echo "array_len=${json_array_len}"
# ==========================================================================

# seq FIRST INCREMENT LAST
for i in $(seq 0 6 ${json_array_len})
do
    echo "Welcome $i times"
    echo "array_${i}=${values[${i}]}"
done






