#!/bin/bash
/home/ubuntu/login-docker.sh

docker pull 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com/sample-ecr:latest

docker run -d --name server-sample 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com/sample-ecr:latest
