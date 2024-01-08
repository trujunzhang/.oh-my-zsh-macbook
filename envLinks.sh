#!/usr/bin/env bash

# Import function files.
source ./bash/files-functions.sh

source ./bash/shellUtils.sh

CURRENT=`pwd`
# Folders in Home.


if [[ $(uname -m) == 'arm64' ]]; then
    # info M2
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"  
fi

if [[ $(uname -m) == 'x86_64' ]]; then
    # info Mackook
    ORGANIZATIONS_HOME="$HOME/Documents/Organizations"
fi

TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"


info "                         "
info "=================================================================================="
info "Bash version ${BASH_VERSION}...           "
info "                                          "
info "** CURRENT:                                "
info "$CURRENT"
info "** ORGANIZATIONS_HOME:                     "
info "$ORGANIZATIONS_HOME"
info "** TRUJUNZHANG_DOTFILES_HOME:              "
info "$TRUJUNZHANG_DOTFILES_HOME"
info "=================================================================================="
info "                                          "

WORKING_FOLD="$ORGANIZATIONS_HOME/__CODING/WORKING"
ENV_PROJECT_FOLD="$WORKING_FOLD/projects_envs"

envs_global_flutter_ieatta=(
    "sbNext/env"     "packages/sbNext/.env.local"
)
envs_github=(
    "trujunzhang/env.example"     "@github/trujunzhang/.env.local"
)
envs_ieatta_three_apps=(
    ".env"         ".env"
)

function link_envs {
  source_name=$1 
  dest_name=$2
  envs_array=("$@")

  fold_source="$ENV_PROJECT_FOLD/$source_name" 
  fold_dest="$WORKING_FOLD/$dest_name"
  

  info "                         "
  info "=================================================================================="
  info "source fold: $fold_source"
  info "dest   fold: $fold_dest"
  info "=================================================================================="
  info "                                          "

  # info "${envs_array[*]}"

    for (( i=2; i<${#envs_array[@]}; i=i+2 ));
    do
      project_env="${envs_array[$i+0]}"
      project_dest="${envs_array[$i+1]}"

      info "element $i is ${project_env}"
      info "element $i is ${project_dest}"

      
      fileLink  "env($project_env)"  "${fold_source}/${project_env}" "${fold_dest}/${project_dest}"
    done


}

link_envs "global-flutter-ieatta" "global-flutter-ieatta"  "${envs_global_flutter_ieatta[@]}" 
link_envs "github"                "@SharedPackage"         "${envs_github[@]}" 
link_envs "ieatta-three-apps"                "ieatta-three-apps"         "${envs_ieatta_three_apps[@]}" 





