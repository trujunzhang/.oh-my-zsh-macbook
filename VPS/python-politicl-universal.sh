#!/usr/bin/env bash

source ../bash/files-functions.sh

appName="python-politicl-universal"
gitProjectTmpSrc="/tmp/${appName}"

if [ ! -d "${gitProjectTmpSrc}" ]
then
    echo "Directory does not exist. ${gitProjectTmpSrc}"
else
    rm -rf "${gitProjectTmpSrc}"
    echo "Directory already exist. ${gitProjectTmpSrc}"
fi

git clone git@bitbucket.org:sidkarwal/python-politicl-universal.git "${gitProjectTmpSrc}"

cd "${gitProjectTmpSrc}"

yarn && npmf && yarn tests && yarn checks &&  yarn ts.lints  && yarn build.current.pending && yarn build.web.server && yarn build.web.cloud
