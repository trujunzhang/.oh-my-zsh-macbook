#!/usr/bin/env bash

GRPC_GIT_URL="https://github.com/grpc/grpc.git"
GRPC_BRANCH="V1.44.0"

WORK_SPACE="/home/deploy/data/youtube"
GRPC_BRANCH_ZIP_FILE="$WORK_SPACE/grpc_branch.zip"

git clone "$GRPC_GIT_URL" "$WORK_SPACE/grpc"

git clone "$WORK_SPACE/grpc" "$WORK_SPACE/grpc-branch" --template= --single-branch --depth 1 --branch "$GRPC_BRANCH"

zip -r "$GRPC_BRANCH_ZIP_FILE" "$WORK_SPACE/grpc-branch" 
