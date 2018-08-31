#!/bin/bash

echo ""
echo "=== Building hello demo app ==="
echo ""

. ./down.sh

docker build -t caspia/hello:latest .
