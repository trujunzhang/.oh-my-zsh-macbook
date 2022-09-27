#!/usr/bin/env bash

GRPC_GIT_URL="https://github.com/grpc/grpc.git"
GRPC_BRANCH="V1.44.0"

git clone "$GRPC_GIT_URL" "/home/deploy/data/youtube/grpc"

git clone "/home/deploy/data/youtube/grpc" "/home/deploy/data/youtube/grpc-branch" --template= --single-branch --depth 1 --branch "$GRPC_BRANCH"


