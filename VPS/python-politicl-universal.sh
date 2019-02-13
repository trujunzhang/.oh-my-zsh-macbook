#!/usr/bin/env bash

source ../bash/files-functions.sh

appName="python-politicl-universal"
gitProjectSrcDir="$HOME/current/${appName}"
currentBranch="fix.filter.13"

if [ ! -d "${gitProjectSrcDir}" ]
then
    git clone git@bitbucket.org:sidkarwal/python-politicl-universal.git "${gitProjectSrcDir}"
    echo "Directory does not exist. ${gitProjectSrcDir}"
else
    # rm -rf "${gitProjectSrcDir}"
    echo "Directory already exist. ${gitProjectSrcDir}"
fi

cd "${gitProjectSrcDir}"

git checkout "${currentBranch}"

git reset --hard

yarn && yarn tests && yarn checks &&  yarn ts.lints  && yarn build.current.pending && yarn build.web.server && yarn build.web.cloud
