#!/bin/bash

$(aws ecr get-login --no-include-email --region ap-northeast-2)
$(docker login --username AWS --password-stdin 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com)
docker pull 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com/sample-ecr:latest

docker run -d --name server 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com/sample-ecr:latest
