#!/usr/bin/env bash 
CURRENT_INSTANCE=$(docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")
if [ "$CURRENT_INSTANCE" ]
then
  docker rm $(docker stop $CURRENT_INSTANCE)
fi

docker pull $IMAGE_NAME

CONTAINER_EXISTS=$(docker ps -a | grep $CONTAINER_NAME)
if [ "$CONTAINER_EXISTS" ] 
then
  docker rm $CONTAINER_NAME
fi

docker create -p 8443:8443 --name $CONTAINER_NAME $IMAGE_NAME
echo $PRIVATE_KEY > CA1.pem
echo $SERVER > server.crt
docker cp ./CA1.pem $CONTAINER_NAME:/CA1.pem
docker cp ./server.crt $CONTAINER_NAME:/server.crt
docker start $CONTAINER_NAME