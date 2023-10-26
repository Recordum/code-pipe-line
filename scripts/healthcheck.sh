#!/bin/bash

URL="http://localhost:3000"
MAX_ATTEMPTS=3

for (( i=1; i<=$MAX_ATTEMPTS; i++ )); do
  response=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
  if [ "$response" == "200" ]; then
    echo "Health check passed"
    exit 0
  else
    echo "Health check failed with status code $response"
    if [ $i -lt $MAX_ATTEMPTS ]; then
      echo "Retrying in 5 seconds..."
      sleep 5
    else
      echo "Health check failed after $MAX_ATTEMPTS attempts"
      exit 1
    fi
  fi
done
