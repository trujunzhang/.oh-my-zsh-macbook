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
git clone https://github.com/abseil/abseil-cpp.git                        $OUT_GIT_FOLD/abseil-cpp
git clone https://github.com/google/benchmark                             $OUT_GIT_FOLD/benchmark
git clone https://github.com/google/bloaty.git                            $OUT_GIT_FOLD/bloaty
git clone https://github.com/google/boringssl.git                         $OUT_GIT_FOLD/boringssl-with-bazel
git clone https://github.com/c-ares/c-ares.git                            $OUT_GIT_FOLD/cares
git clone https://github.com/envoyproxy/data-plane-api.git                $OUT_GIT_FOLD/envoy-api
git clone https://github.com/googleapis/googleapis.git                    $OUT_GIT_FOLD/googleapis
git clone https://github.com/google/googletest.git                        $OUT_GIT_FOLD/googletest
git clone https://github.com/libuv/libuv.git                              $OUT_GIT_FOLD/libuv 
git clone https://github.com/census-instrumentation/opencensus-proto.git  $OUT_GIT_FOLD/opencensus-proto
git clone https://github.com/open-telemetry/opentelemetry-proto.git       $OUT_GIT_FOLD/opentelemetry
git clone https://github.com/protocolbuffers/protobuf.git                 $OUT_GIT_FOLD/protobuf
git clone https://github.com/google/re2.git                               $OUT_GIT_FOLD/re2
git clone https://github.com/cncf/xds.git                                 $OUT_GIT_FOLD/xds
git clone https://github.com/madler/zlib                                  $OUT_GIT_FOLD/zlib

# ========================================================= 
# zip
# ========================================================= 
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/abseil-cpp/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/benchmark/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/bloaty/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/boringssl-with-bazel/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/cares/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/envoy-api/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/googleapis/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/googletest/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/libuv/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/opencensus-proto/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/opentelemetry/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/protobuf/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/re2/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/xds/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/zlib/.git

	# git clone https://github.com/aquynh/capstone.git
	# git clone https://github.com/nico/demumble.git

