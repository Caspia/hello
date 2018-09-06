#!/bin/bash

# script to bring up demo app hello

echo ""
echo "=== hello demo app going up"
echo ""

./down.sh

if [ "$HELLO_PORT" == "" ]; then
  HELLO_PORT=3000
fi
export HELLO_PORT=$HELLO_PORT

docker run -d --restart=always --network="beluga" \
 --name hello --net-alias hello \
 --env "VIRTUAL_HOST=hello.ed,hello.ed.local" \
 --env "VIRTUAL_PORT=$HELLO_PORT" \
 --env "HELLO_PORT=$HELLO_PORT" \
 -p "$HELLO_PORT:$HELLO_PORT" \
 caspia/hello:latest 
