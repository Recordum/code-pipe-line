#!/bin/bash

URL="http://localhost:3001"
MAX_ATTEMPTS=3

sleep 20

for (( i=1; i<=$MAX_ATTEMPTS; i++ )); do
  response=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
  if [ "$response" == "200" ]; then
    echo "Health check passed"
    sleep 5
  else
    echo "Health check failed with status code $response"
    exit 1
  fi
done
