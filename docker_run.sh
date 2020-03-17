#!/bin/sh

source ./version.sh

# detach the interactive: Ctrl+p, Ctrl+q
# reattach: docker attach myaergo
# Interactive mode:
#docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:$AERGO_ISDB_VERSION /bin/bash
# latest version
#docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb /bin/bash
# Execute default CMD
#docker run --rm -itd -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:$AERGO_ISDB_VERSION
# latest version
#docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb
docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb
# Follow logs
#docker logs -f myaergo
