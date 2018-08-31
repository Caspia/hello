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

docker run -d --restart=always -p "$HELLO_PORT:$HELLO_PORT" \
 --name hello --net-alias hello.ed --net-alias demo.ed --network="beluga" \
 --env "VIRTUAL_HOST=hello.ed,demo.ed" -e "VIRTUAL_PORT=$HELLO_PORT" \
 caspia/hello:latest 
