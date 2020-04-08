#!/bin/sh

source ./version.sh

# latest
docker push hanlsin/aergo.isdb:latest

docker push hanlsin/aergo.isdb:$AERGO_ISDB_VERSION

