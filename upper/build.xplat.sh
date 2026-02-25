#!/bin/bash
set -e

echo "::group::Testing..."
go test -v
echo "::endgroup::"

APP_NAME=upper
OUTPUT_DIR=bin

mkdir -p $OUTPUT_DIR

platforms=("windows/amd64" "linux/amd64" "darwin/amd64")
for platform in "${platforms[@]}"
do
    platform_split=(${platform//\//})
    GOOS=${platform_split[0]}
    GOARCH=${plataform_split[1]}
    output_name=$OUTPUT_DIR/$APP_NAME'-'$GOOS'-'$GOARCH
    if [$GOOS="windows"]; then
    output_name+='.exe'
    fi
    echo "::group::Building $output_name..."
    go clean
    env GOOS=$GOOS GOARCG=$GOARCH go build -x -o $output_name .
    echo "::endgroup::"

done

echo "::group::tree..."

tree
    echo "::endgroup::"

