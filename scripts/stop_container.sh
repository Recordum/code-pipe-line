#!/bin/bash
if [ "$(docker ps -q -f name=server-sample)" ]; then
    docker stop server-sample
fi
