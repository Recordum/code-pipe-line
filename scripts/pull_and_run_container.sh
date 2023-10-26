#!/bin/bash

# Docker 이미지 이름
IMAGE_NAME="368081054787.dkr.ecr.ap-northeast-2.amazonaws.com/sample-ecr:latest"

# 로그 그룹 이름
LOG_GROUP_NAME="sample-nestjs"

$(aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 368081054787.dkr.ecr.ap-northeast-2.amazonaws.com)

docker pull $IMAGE_NAME

CONTAINER_ID=$(docker run -d --name server-sample --log-driver=awslogs \
                           --log-opt awslogs-region=ap-northeast-2 \
                           --log-opt awslogs-group=$LOG_GROUP_NAME \
                           --log-opt awslogs-create-group=true \
                           $IMAGE_NAME)

docker update --log-driver=awslogs \
              --log-opt awslogs-region=ap-northeast-2 \
              --log-opt awslogs-group=$LOG_GROUP_NAME \
              --log-opt awslogs-stream=$CONTAINER_ID \
              $CONTAINER_ID