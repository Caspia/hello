#!/bin/bash

# script to bring up demo app hello

if ["$HELLO_PORT" == ""]; then
  HELLO_PORT=3000
fi
export HELLO_PORT=$HELLO_PORT

docker build -t caspia/hello:latest .
docker run -d --restart=always -p "$HELLO_PORT:$HELLO_PORT" --name hello --network="beluga" --env "VIRTUAL_HOST=hello.ed VIRTUAL_PORT=$HELLO_PORT" caspia/hello:latest 