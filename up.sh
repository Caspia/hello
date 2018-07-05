#!/bin/bash

# script to bring up demo app hello

./down.sh

if [ "$HELLO_PORT" == "" ]; then
  HELLO_PORT=3000
fi
export HELLO_PORT=$HELLO_PORT

if [ -z "$OFFLINE" ]; then
  docker build -t caspia/hello:latest .
fi
docker run -d --restart=always -p "$HELLO_PORT:$HELLO_PORT" --name hello --network="beluga" --env "VIRTUAL_HOST=hello.ed" -e "VIRTUAL_PORT=$HELLO_PORT" caspia/hello:latest 
