#!/usr/bin/env bash

LIBAOM_FOLD="$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode"
LIBAOM_FOLD_ORIGINAL="$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode-original"
LIBAOM_THIRD_FOLD="$LIBAOM_FOLD"
THIRD_PARTY_URL="file://$HOME/Documents/Organizations/__CACHES/github/@spec/libaom-Xcode_submodules"

LIBAOM_GIT_BRANCH="3.0.0"

git clone "file://${LIBAOM_FOLD_ORIGINAL}" "${LIBAOM_FOLD}"

function initial_libaom {
cd "${LIBAOM_FOLD}"

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
       git submodule add "${THIRD_PARTY_URL}/aom"                 aom
}

echo "                         "
echo "==============================================================="
echo "Bash version ${BASH_VERSION}..."
echo "==============================================================="

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
