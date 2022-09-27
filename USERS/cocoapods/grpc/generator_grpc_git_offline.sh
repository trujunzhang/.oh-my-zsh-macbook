#!/usr/bin/env bash

OUT_GIT_FOLD='/home/deploy/data/youtube/grpc_third'
GITHUB_ZIP_FILE='/home/deploy/data/youtube/grpc_third.zip'
END_TAG='/home/deploy/data/youtube/end.txt'

# ========================================================= 
# ready
# ========================================================= 
rm -rf $OUT_GIT_FOLD
mkdir $OUT_GIT_FOLD
rm -f $GITHUB_ZIP_FILE
rm -f $END_TAG
# ========================================================= 
# clone
# ========================================================= 

	url = https://github.com/google/benchmark
	url = https://github.com/libuv/libuv.git
	url = https://github.com/envoyproxy/data-plane-api.git
	url = https://github.com/abseil/abseil-cpp.git
	url = https://github.com/open-telemetry/opentelemetry-proto.git
	url = https://github.com/google/bloaty.git
	url = https://github.com/abseil/abseil-cpp.git
	url = https://github.com/aquynh/capstone.git
	url = https://github.com/nico/demumble.git
	url = https://github.com/google/googletest.git
	url = https://github.com/protocolbuffers/protobuf.git
	url = https://github.com/google/re2
	url = https://github.com/madler/zlib
	url = https://github.com/madler/zlib
	url = https://github.com/google/re2.git
	url = https://github.com/google/boringssl.git
	url = https://github.com/c-ares/c-ares.git
	url = https://github.com/googleapis/googleapis.git
	url = https://github.com/census-instrumentation/opencensus-proto.git
	url = https://github.com/google/googletest.git
	url = https://github.com/cncf/xds.git
	url = https://github.com/protocolbuffers/protobuf.git
	url = https://github.com/google/benchmark.git
	url = https://github.com/google/googletest.git

