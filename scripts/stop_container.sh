#!/bin/bash
if [ "$(docker ps -q -f name=server-sample)" ]; then
    echo "Stopping server-sample container..."
    docker stop server-sample
else
    echo "server-sample container is not running."
fi
