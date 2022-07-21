#!/usr/bin/env bash

OUT_GIT_FOLD='/home/deploy/data/youtube/common'
GITHUB_ZIP_FILE='/home/deploy/data/youtube/common.zip'
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
git clone https://github.com/BranchMetrics/iOS-Deferred-Deep-Linking-SDK.git  $OUT_GIT_FOLD/iOS-Deferred-Deep-Linking-SDK
git clone https://github.com/google/leveldb.git                               $OUT_GIT_FOLD/leveldb
git clone https://github.com/facebook/yoga.git                                $OUT_GIT_FOLD/yoga                                      
git clone https://github.com/google/google-toolbox-for-mac.git                $OUT_GIT_FOLD/google-toolbox-for-mac
git clone https://github.com/google/GoogleDataTransport.git                   $OUT_GIT_FOLD/GoogleDataTransport
git clone https://github.com/abseil/abseil-cpp.git                            $OUT_GIT_FOLD/abseil-cpp
git clone https://github.com/fmtlib/fmt.git                                   $OUT_GIT_FOLD/fmt
git clone https://github.com/facebook/facebook-objc-sdk.git                   $OUT_GIT_FOLD/facebook-objc-sdk
git clone https://github.com/firebase/firebase-ios-sdk.git                    $OUT_GIT_FOLD/firebase-ios-sdk
git clone https://github.com/facebook/flipper.git                             $OUT_GIT_FOLD/flipper
git clone https://github.com/openid/AppAuth-iOS.git                           $OUT_GIT_FOLD/AppAuth-iOS
git clone https://github.com/BoltsFramework/Bolts-ObjC.git                    $OUT_GIT_FOLD/Bolts-ObjC
git clone https://github.com/google/promises.git                              $OUT_GIT_FOLD/promises
git clone https://github.com/google/gtm-session-fetcher.git                   $OUT_GIT_FOLD/gtm-session-fetcher
git clone https://github.com/getsentry/sentry-cocoa.git                       $OUT_GIT_FOLD/sentry-cocoa
git clone https://github.com/rsocket/rsocket-cpp.git                          $OUT_GIT_FOLD/rsocket-cpp
git clone https://github.com/lblasa/double-conversion.git                     $OUT_GIT_FOLD/double-conversion
git clone https://github.com/tonymillion/Reachability.git                     $OUT_GIT_FOLD/Reachability
git clone https://github.com/libevent/libevent.git                            $OUT_GIT_FOLD/libevent
git clone https://github.com/ccgus/fmdb.git                                   $OUT_GIT_FOLD/fmdb
git clone https://github.com/lblasa/glog.git                                  $OUT_GIT_FOLD/glog
git clone https://github.com/facebook/facebook-sdk-swift.git                  $OUT_GIT_FOLD/facebook-sdk-swift
git clone https://github.com/google/GoogleUtilities.git                       $OUT_GIT_FOLD/GoogleUtilities
git clone https://github.com/realm/realm-cocoa.git                            $OUT_GIT_FOLD/realm-cocoa
git clone https://github.com/google/glog.git                                  $OUT_GIT_FOLD/glog
git clone https://github.com/robbiehanson/CocoaAsyncSocket.git                $OUT_GIT_FOLD/CocoaAsyncSocket
git clone https://github.com/nanopb/nanopb.git                                $OUT_GIT_FOLD/nanopb
git clone https://github.com/facebook/folly.git                               $OUT_GIT_FOLD/folly
git clone https://github.com/protocolbuffers/protobuf.git                     $OUT_GIT_FOLD/protobuf
git clone https://github.com/priteshrnandgaonkar/Flipper-Boost-iOSX.git       $OUT_GIT_FOLD/Flipper-Boost-iOSX
git clone https://github.com/google/GTMAppAuth.git                            $OUT_GIT_FOLD/GTMAppAuth

# ========================================================= 
# zip
# ========================================================= 
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/iOS-Deferred-Deep-Linking-SDK/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/leveldb/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/yoga/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/google-toolbox-for-mac/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/GoogleDataTransport/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/abseil-cpp/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/fmt/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/facebook-objc-sdk/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/firebase-ios-sdk/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/flipper/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/AppAuth-iOS/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/Bolts-ObjC/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/promises/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/gtm-session-fetcher/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/sentry-cocoa/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/rsocket-cpp/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/double-conversion/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/Reachability/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/libevent/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/fmdb/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/glog/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/facebook-sdk-swift/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/GoogleUtilities/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/realm-cocoa/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/glog/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/CocoaAsyncSocket/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/nanopb/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/folly/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/protobuf/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/Flipper-Boost-iOSX/.git
zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/GTMAppAuth/.git

# ========================================================= 
# end
# ========================================================= 
touch $END_TAG
