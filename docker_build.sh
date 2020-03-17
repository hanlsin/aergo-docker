#!/bin/sh

source ./version.sh

# latest
docker build --build-arg GIT_REPO="github.com/hanlsin/aergo" --build-arg GIT_BRANCH="isdb" -t hanlsin/aergo.isdb .

docker build --build-arg GIT_REPO="github.com/hanlsin/aergo" --build-arg GIT_BRANCH="isdb" -t hanlsin/aergo.isdb:$AERGO_ISDB_VERSION .

