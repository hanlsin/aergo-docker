#!/bin/sh
docker build --build-arg GIT_REPO="github.com/hanlsin/aergo" --build-arg GIT_BRANCH="isdb" -t hanlsin/aergo.isdb:0.1 .
