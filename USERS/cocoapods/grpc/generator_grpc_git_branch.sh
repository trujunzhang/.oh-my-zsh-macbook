#!/usr/bin/env bash

GRPC_FOLD="$HOME/Documents/Organizations/__CACHES/github/@spec/grpc-branch"
GRPC_THIRD_FOLD="$GRPC_FOLD/third_party"
THIRD_PARTY_URL="file://$HOME/Documents/Organizations/__CACHES/github/@spec/grpc_third"

cd "$GRPC_FOLD"

# ready 
rm -rf .git

# create git repository
git init 
git add . 
git commit -m 'first commit' 

# ========================================================= 
# Delete all git modules folds
# ========================================================= 
function rm_sub_modules_folds {
       rm -rf  "$GRPC_THIRD_FOLD/abseil-cpp"                 
       rm -rf  "$GRPC_THIRD_FOLD/benchmark"                  
       rm -rf  "$GRPC_THIRD_FOLD/bloaty"                     
       rm -rf  "$GRPC_THIRD_FOLD/boringssl-with-bazel"       
       rm -rf  "$GRPC_THIRD_FOLD/cares"                      
       rm -rf  "$GRPC_THIRD_FOLD/envoy-api"                  
       rm -rf  "$GRPC_THIRD_FOLD/googleapis"                 
       rm -rf  "$GRPC_THIRD_FOLD/googletest"                 
       rm -rf  "$GRPC_THIRD_FOLD/libuv"                      
       rm -rf  "$GRPC_THIRD_FOLD/opencensus-proto"           
       rm -rf  "$GRPC_THIRD_FOLD/opentelemetry"              
       rm -rf  "$GRPC_THIRD_FOLD/protobuf"                   
       rm -rf  "$GRPC_THIRD_FOLD/re2"                        
       rm -rf  "$GRPC_THIRD_FOLD/xds"                        
       rm -rf  "$GRPC_THIRD_FOLD/zlib"   
}
                   


# echo "$THIRD_PARTY_URL/abseil-cpp" 
# ========================================================= 
# add third libraries as git modules
# ========================================================= 
function git_add_submodules {
       git submodule add "$THIRD_PARTY_URL/abseil-cpp"                 third_party/abseil-cpp
       git submodule add "$THIRD_PARTY_URL/benchmark"                  third_party/benchmark
       #git submodule add "$THIRD_PARTY_URL/bloaty"                     third_party/bloaty
       #git submodule add "$THIRD_PARTY_URL/boringssl-with-bazel"       third_party/boringssl-with-bazel
       #git submodule add "$THIRD_PARTY_URL/cares"                      third_party/cares
       #git submodule add "$THIRD_PARTY_URL/envoy-api"                  third_party/envoy-api
       #git submodule add "$THIRD_PARTY_URL/googleapis"                 third_party/googleapis
       #git submodule add "$THIRD_PARTY_URL/googletest"                 third_party/googletest
       # git submodule add "$THIRD_PARTY_URL/libuv"                      third_party/libuv
       # git submodule add "$THIRD_PARTY_URL/opencensus-proto"           third_party/opencensus-proto
       # git submodule add "$THIRD_PARTY_URL/opentelemetry"              third_party/opentelemetry
       # git submodule add "$THIRD_PARTY_URL/protobuf"                   third_party/protobuf
       git submodule add "$THIRD_PARTY_URL/re2"                        third_party/re2
       git submodule add "$THIRD_PARTY_URL/xds"                        third_party/xds
       git submodule add "$THIRD_PARTY_URL/zlib"                       third_party/zlib
}

echo "                         "
echo "==============================================================="
echo "Bash version ${BASH_VERSION}..."
echo "==============================================================="

rm .gitmodules
touch .gitmodules

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
git commit -m 'add moduls' 

git checkout -b v1.44.0