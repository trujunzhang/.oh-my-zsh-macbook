#!/usr/bin/env bash

LIBVMAF_FOLD="$HOME/Documents/Organizations/__CACHES/github/@spec/libvmaf-Xcode"
LIBVMAF_FOLD_ORIGINAL="$HOME/Documents/Organizations/__CACHES/github/@spec/libvmaf-Xcode-original"
LIBVMAF_THIRD_FOLD="$LIBVMAF_FOLD"
THIRD_PARTY_URL="file://$HOME/Documents/Organizations/__CACHES/github/@spec/libvmaf-Xcode_submodules"

LIBVMAF_GIT_BRANCH="2.3.1"

function initial_LIBVMAF {

       git checkout "${LIBVMAF_GIT_BRANCH}"

       git reset --hard

       # ready
       rm -rf .git

       # create git repository
       git init
       git add .
       git commit -m 'first commit'


       git rm .gitmodules
       touch .gitmodules
}

# ========================================================= 
# Delete all git modules folds
# ========================================================= 
function rm_sub_modules_folds {
       rm -rf  "${LIBVMAF_THIRD_FOLD}/vmaf"
}

# echo "$THIRD_PARTY_URL/abseil-cpp" 
# ========================================================= 
# add third libraries as git modules
# ========================================================= 
function git_add_submodules {
       git submodule add "${THIRD_PARTY_URL}/vmaf"  vmaf
}

function generator_local_branch_repository {
       echo "                         "
       echo "==============================================================="
       echo "Bash version ${BASH_VERSION}..."
       echo "==============================================================="

       git clone "file://${LIBVMAF_FOLD_ORIGINAL}" "${LIBVMAF_FOLD}"
       cd "${LIBVMAF_FOLD}"
       
       initial_LIBVMAF

       echo "                         "
       echo "rm sub modules folds"
       echo "==============================================================="
       echo "                         "
       rm_sub_modules_folds

       sleep 12

       echo "                         "
       echo "add third libraries as git modules"
       echo "==============================================================="
       echo "                         "
       git_add_submodules

       git add .
       git commit -m 'add sub moduls'

       git checkout -b "${LIBVMAF_GIT_BRANCH}"
}


        if [ -d  "${LIBVMAF_FOLD}" ]; then
            echo "<*${LIBVMAF_FOLD}*> already exist!"
        else
            generator_local_branch_repository
        fi

        
