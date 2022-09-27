#!/usr/bin/env bash

GRPC_GIT_URL="https://github.com/grpc/grpc.git"
GRPC_BRANCH="v1.44.0"

WORK_SPACE="/home/deploy/data/youtube"

GRPC_ORIGINAL_LOCAL="file://$WORK_SPACE/grpc"
GRPC_BRANCH_LOCAL="$WORK_SPACE/grpc-branch"

GRPC_BRANCH_ZIP_FILE="$WORK_SPACE/grpc-branch.zip"

git clone "$GRPC_GIT_URL" "$WORK_SPACE/grpc"

git clone "$GRPC_ORIGINAL_LOCAL" "$GRPC_BRANCH_LOCAL" --template= --single-branch --depth 1 --branch "$GRPC_BRANCH"

zip -r "$GRPC_BRANCH_ZIP_FILE" "$GRPC_BRANCH_LOCAL" 
