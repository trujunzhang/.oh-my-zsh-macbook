#!/usr/bin/env bash

LIBAOM_FOLD="$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode"
LIBAOM_FOLD_ORIGINAL="$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode-original"
LIBAOM_THIRD_FOLD="$LIBAOM_FOLD"
THIRD_PARTY_FOLD="$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode_submodules"
THIRD_PARTY_URL="file://${THIRD_PARTY_FOLD}"

LIBAOM_GIT_BRANCH="3.0.0"

LIBAOM_SUBMODULE_REVISION="d853caa2ab62d161e5edf344ffee7b597449dc0d"

function initial_libaom {
       git checkout "${LIBAOM_GIT_BRANCH}"

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
       rm -rf  "${LIBAOM_THIRD_FOLD}/aom"
}

# echo "$THIRD_PARTY_URL/abseil-cpp" 
# ========================================================= 
# add third libraries as git modules
# ========================================================= 
function git_add_submodules {
       git submodule add "${THIRD_PARTY_URL}/aom"   aom
}

function generator_local_branch_repository {
       echo "                         "
       echo "==============================================================="
       echo "Bash version ${BASH_VERSION}..."
       echo "==============================================================="

       git clone "file://${LIBAOM_FOLD_ORIGINAL}" "${LIBAOM_FOLD}"
       cd "${LIBAOM_FOLD}"
       
       initial_libaom

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

       git checkout -b "${LIBAOM_GIT_BRANCH}"
}


        if [ -d  "${LIBAOM_FOLD}" ]; then
            echo "<*${LIBAOM_FOLD}*> already exist!"
        else
            generator_local_branch_repository
        fi


        

        
