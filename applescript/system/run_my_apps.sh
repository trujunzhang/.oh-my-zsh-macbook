#!/usr/bin/env bash

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

    declare -p values # print the array
    # echo "                         "
}

parseJson  "$HOME/shellstartup.json"

# Get the json array's length
json_array_len=${#values[@]}
echo "array_len=${json_array_len}"
echo "                         "
# ==========================================================================



# seq FIRST INCREMENT LAST
for i in $(seq 0 4 $((json_array_len-1)))
do
    sleep 2

    name=${values[$((i+1))]}
    application=${values[$((i+2))]}
    enable=${values[$((i+3))]}

    echo "name: $name"
    echo "application: $application"
    echo "                         "

    if [ "$enable" = "1" ]; then
        open -a "$application"
    fi

done