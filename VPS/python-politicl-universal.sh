#!/usr/bin/env bash

source ../bash/files-functions.sh

appName="python-politicl-universal"
gitProjectTmpSrc="/tmp/${appName}"
currentBranch="add.database.12"

if [ ! -d "${gitProjectTmpSrc}" ]
then
    echo "Directory does not exist. ${gitProjectTmpSrc}"
else
    rm -rf "${gitProjectTmpSrc}"
    echo "Directory already exist. ${gitProjectTmpSrc}"
fi

git clone git@bitbucket.org:sidkarwal/python-politicl-universal.git "${gitProjectTmpSrc}"

cd "${gitProjectTmpSrc}"

git checkout "${currentBranch}"

git reset --hard

yarn && npmf && yarn tests && yarn checks &&  yarn ts.lints  && yarn build.current.pending && yarn build.web.server && yarn build.web.cloud
