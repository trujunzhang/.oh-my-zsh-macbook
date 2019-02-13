#!/usr/bin/env bash

source ../bash/files-functions.sh

appName="python-politicl-universal"
gitProjectTmpSrc="/tmp/${appName}"
currentBranch="add.database.12"

if [ ! -d "${gitProjectTmpSrc}" ]
then
    git clone git@bitbucket.org:sidkarwal/python-politicl-universal.git "${gitProjectTmpSrc}"
    echo "Directory does not exist. ${gitProjectTmpSrc}"
else
    # rm -rf "${gitProjectTmpSrc}"
    echo "Directory already exist. ${gitProjectTmpSrc}"
fi

cd "${gitProjectTmpSrc}"

git checkout "${currentBranch}"

git reset --hard

yarn && yarn tests && yarn checks &&  yarn ts.lints  && yarn build.current.pending && yarn build.web.server && yarn build.web.cloud
