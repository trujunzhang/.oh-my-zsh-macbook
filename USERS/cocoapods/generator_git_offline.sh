#!/usr/bin/env bash

# Check if RED has already been defined
if [ -z "${RED+x}" ]; then
  declare -r RED=$'\e[1;31m'
fi

# Check if RESET has already been defined
if [ -z "${RESET+x}" ]; then
  declare -r RESET=$'\e[0m'
fi

function error {
  echo "💥 $RED$1$RESET"
}

DEFAULTVALUE="vps"
Params="${1:-$DEFAULTVALUE}"

WORK_DIR="/tmp"

if [[ $(uname -m) == 'arm64' ]]; then
    WORK_DIR="/tmp"
elif [ "$Params" = "$DEFAULTVALUE" ]; then
    WORK_DIR="/home/deploy/data"
fi

OUT_GIT_FOLD="${WORK_DIR}/youtube/@common"
GITHUB_ZIP_FILE="${WORK_DIR}/youtube/common.zip"
END_TAG="${WORK_DIR}/youtube/end.txt"

echo "params = ${Params}"
echo "workdir = ${WORK_DIR}"
echo "outgitfold = ${OUT_GIT_FOLD}"
echo "githubzipfile = ${GITHUB_ZIP_FILE}"
echo "endtag = ${END_TAG}"

# =========================================================
# ready
# =========================================================
function initialFold {
    # rm -rf $OUT_GIT_FOLD
    mkdir -p $OUT_GIT_FOLD
    # rm -f $GITHUB_ZIP_FILE
    # rm -f $END_TAG
}

# =========================================================
# clone
# =========================================================

git_libs=(
    "https://github.com/BranchMetrics/iOS-Deferred-Deep-Linking-SDK.git" "iOS-Deferred-Deep-Linking-SDK"
    "https://github.com/google/leveldb.git" "leveldb"
    "https://github.com/facebook/yoga.git" "yoga"
    "https://github.com/google/google-toolbox-for-mac.git" "google-toolbox-for-mac"
    "https://github.com/google/GoogleDataTransport.git" "GoogleDataTransport"
    "https://github.com/abseil/abseil-cpp.git" "abseil-cpp"
    "https://github.com/fmtlib/fmt.git" "fmt"
    "https://github.com/facebook/facebook-objc-sdk.git" "facebook-objc-sdk"
    "https://github.com/firebase/firebase-ios-sdk.git" "firebase-ios-sdk"
    "https://github.com/facebook/flipper.git" "flipper"
    "https://github.com/openid/AppAuth-iOS.git" "AppAuth-iOS"
    "https://github.com/BoltsFramework/Bolts-ObjC.git" "Bolts-ObjC"
    "https://github.com/google/promises.git" "promises"
    "https://github.com/google/gtm-session-fetcher.git" "gtm-session-fetcher"
    "https://github.com/getsentry/sentry-cocoa.git" "sentry-cocoa"
    "https://github.com/rsocket/rsocket-cpp.git" "rsocket-cpp"
    "https://github.com/lblasa/double-conversion.git" "double-conversion"
    "https://github.com/tonymillion/Reachability.git" "Reachability"
    "https://github.com/libevent/libevent.git" "libevent"
    "https://github.com/ccgus/fmdb.git" "fmdb"
    # glog-lblasa
    "https://github.com/lblasa/glog.git" "glog-lblasa"
    "https://github.com/facebook/facebook-sdk-swift.git" "facebook-sdk-swift"
    "https://github.com/google/GoogleUtilities.git" "GoogleUtilities"
    "https://github.com/realm/realm-cocoa.git" "realm-cocoa"
    # glog-google
    "https://github.com/google/glog.git" "glog-google"
    "https://github.com/robbiehanson/CocoaAsyncSocket.git" "CocoaAsyncSocket"
    "https://github.com/nanopb/nanopb.git" "nanopb"
    "https://github.com/facebook/folly.git" "folly"
    "https://github.com/protocolbuffers/protobuf.git" "protobuf"
    "https://github.com/priteshrnandgaonkar/Flipper-Boost-iOSX.git" "Flipper-Boost-iOSX"
    "https://github.com/google/GTMAppAuth.git" "GTMAppAuth"

    "https://github.com/libuv/libuv.git" "libuv"
    "https://github.com/SDWebImage/SDWebImage.git" "SDWebImage"
    "https://github.com/SDWebImage/SDWebImageWebPCoder.git" "SDWebImageWebPCoder"
)

function clone_github {

    for ((i = 0; i < ${#git_libs[@]}; i = i + 2)); do
        gitUrl="${git_libs[$i + 0]}"
        fold="${git_libs[$i + 1]}"
        destFold="${OUT_GIT_FOLD}/${fold}"
        echo ""
        echo "element $i is ${gitUrl}"
        echo "element $i is ${destFold}"

        echo ""

        if [ ! -d "${destFold}" ]; then
            # first of all, clone it to the dest fold
            git clone ${gitUrl} ${destFold} --depth=1
        fi

        # then, fetch tags
        if [  -d "${destFold}" ]; then
            cd ${destFold}
            git fetch --tags
        fi

        echo ""
    done
}

# =========================================================
# zip
# =========================================================
function zip_github {

    for ((i = 0; i < ${#git_libs[@]}; i = i + 2)); do
        gitUrl="${git_libs[$i + 0]}"
        destFold="${git_libs[$i + 1]}"
        echo ""
        echo "element $i is ${gitUrl}"
        echo "element $i is ${destFold}"

        echo ""
        zip -r $GITHUB_ZIP_FILE $OUT_GIT_FOLD/${destFold}/.git
        echo ""
    done

}

function check_gits_length {
    gits_total_length="${#git_libs[@]}"
    gits_two_array=2
    gits_length=$((gits_total_length / gits_two_array))

    local_folder_length=0
    ARRAY=()
    for i in $(ls -d ${OUT_GIT_FOLD}/*/); do
        ((local_folder_length= local_folder_length + 1))
        filename=$(basename -- "$i")
        # echo ${filename%%/};
        ARRAY+=(${filename})
    done

    # echo ${ARRAY[@]}

    echo ""
    for ((lib = 0; lib < ${#git_libs[@]}; lib = lib + 2)); do
        gitUrl="${git_libs[$lib + 0]}"
        destFold="${git_libs[$lib + 1]}"
        exist="false"
        for i in "${ARRAY[@]}"; do
            if [ "$i" == "$destFold" ]; then
                # echo "Found"
                # echo "${i} is exist"
                exist="true"
            fi
        done
        if [ "$exist" == "false" ]; then
            error "*${destFold}* not exist"
        fi
    done
    echo ""

    echo length of git urls: $gits_length
    echo length folder of $OUT_GIT_FOLD: $local_folder_length
}

if [ -d "${WORK_DIR}" ]; then
    initialFold
    
    clone_github
    check_gits_length

    if [ "$gits_length" = "$local_folder_length" ]; then
        if [ ! -f "${GITHUB_ZIP_FILE}" ]; then
            zip_github
        fi
    fi

    # =========================================================
    # end
    # =========================================================
    touch $END_TAG

else
    echo "${WORK_DIR} not exist"
fi
