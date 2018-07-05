#!/bin/bash

# script to stop and delete docker container for hello
docker container rm --force hello 2> /dev/null
