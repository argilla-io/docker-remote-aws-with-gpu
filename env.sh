#!/bin/bash

eval $(docker-machine env $1)
export NV_HOST="ssh://ubuntu@$(docker-machine ip $1):"
export NV_ARGS=$(docker-machine ssh $1 curl -s http://localhost:3476/docker/cli)
ssh-add $DOCKER_CERT_PATH/id_rsa