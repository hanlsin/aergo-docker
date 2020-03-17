#!/bin/sh

# detach the interactive: Ctrl+p, Ctrl+q
# reattach: docker attach myaergo
# Interactive mode:
#docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:0.1 /bin/bash
# Execute default CMD
docker run --rm -itd -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:0.1
# Follow logs
docker logs -f myaergo
