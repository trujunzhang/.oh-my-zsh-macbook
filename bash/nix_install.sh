#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can't create temporary directory for downloading the Nix binary tarball")"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=d9efe6e0ab8a377be74fd8879e3c8fa61b529d6f0ed52531663bdcb22994657d
        path=5wp1slshx1svjiv3xpy9ms1gb658s9zg/nix-2.16.0-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=7a522e06bb81ea709af06a9c7da41c558349e0bcd109810a6d91d473623ae51a
        path=a5wy6r30x06ab9h07z996m6i8cd2451h/nix-2.16.0-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=ed6ffd2f126f28dd2fd2cad7e257c123e6b51ee40a3b4447a388e41f6786c4ac
        path=v37hqnq1nwzmrm47v0gdy08xyrly8350/nix-2.16.0-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l)
        hash=8f894ef02e0e485e0d9798b87874b20eba5798a2648eaa865b1345af878b08e3
        path=j5yx9cyz71glc2r789zhyjwj7y1pa9bj/nix-2.16.0-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l)
        hash=6fb60b13daaae614eed4d83e0641c68208c3125d4540f6022acc3aab40005dee
        path=0g96sb72hb2mk882wwld2dmb4kwdyhwl/nix-2.16.0-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Darwin.x86_64)
        hash=68e0975f8fdb11bae5751b694bda51efb0ae3be4846b71cd129d895f1330d5e5
        path=va90502iyrbgfisvg6dggmbi534cfw5d/nix-2.16.0-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=c6bd86b7a732b8dda2ff7f64598a0a22a33c8230e095fdee1721832a4f9a2650
        path=wh2lwfakv71nn6ddyflbl72s9zznczav/nix-2.16.0-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.16.0/nix-2.16.0-$system.tar.xz
fi

tarball=$tmpDir/nix-2.16.0-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

if command -v curl > /dev/null 2>&1; then
    fetch() { curl --fail -L "$1" -o "$2"; }
elif command -v wget > /dev/null 2>&1; then
    fetch() { wget "$1" -O "$2"; }
else
    oops "you don't have wget or curl installed, which I need to download the binary tarball"
fi

echo "downloading Nix 2.16.0 binary tarball for $system from '$url' to '$tmpDir'..."
fetch "$url" "$tarball" || oops "failed to download '$url'"

if command -v sha256sum > /dev/null 2>&1; then
    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
elif command -v shasum > /dev/null 2>&1; then
    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
elif command -v openssl > /dev/null 2>&1; then
    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
else
    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
fi

if [ "$hash" != "$hash2" ]; then
    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
fi

unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping