# Run a single AERGO node
```
docker run --rm -itd -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:0.1
```

# Run a single AERGO Node with interactive mode
```
docker run --rm -it -p 7845:7845 --name=myaergo hanlsin/aergo.isdb:0.1 /bin/bash
$ ./run.sh
```

## Stop the node
`Ctrl`+`c`

## Restart the node
```
$ ./start.sh
```

## Clean all data
```
$ ./clean.sh
```

## Start a new node from block 0
```
$ ./init.sh
$ ./start.sh
```
or
```
$ ./run.sh
```

# Show and follow logs
```
docker logs -f myaergo
```

# Attach to the AERGO node
```
docker attach myaergo
```

# Detach the container
Press `Ctrl`+`p`, `Ctrl`+`q`.

