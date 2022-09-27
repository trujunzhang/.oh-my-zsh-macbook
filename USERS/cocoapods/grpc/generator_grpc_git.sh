#!/usr/bin/env bash

GRPC_FOLD="/Users/djzhang/Documents/Organizations/__CACHES/github/@spec/grpc"
THIRD_PARTY_URL="file:///Users/djzhang/Documents/Organizations/__CACHES/github/@spec/third_party"

cd "$GRPC_FOLD"

# Create git repository
# git init 
# git add . 
# git commit -m 'first commit' 

# Add third libraries as git modules

echo "$THIRD_PARTY_URL/abseil-cpp" 
# git submodule add "$THIRD_PARTY_URL/abseil-cpp" third_party/abseil-cppxxx
