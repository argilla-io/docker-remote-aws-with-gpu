#!/bin/bash

DOCKER_MACHINE_PATH=$(which docker-machine)
AWS_PATH=$(which aws)

if [ -z "$AWS_PATH" ]; then
        echo "aws client not found!!. "
        echo "Please, install aws client (pip install awscli --upgrade --user) "
        echo "and then configure aws environment (aws configure)"
        exit 1
fi

if [ -z "$DOCKER_MACHINE_PATH" ]; then
        echo "docker-machine  not found!!. "
        echo "Please install docker"
        exit 1
fi

BASEDIR=`pwd`

ln -s $BASEDIR/nvidia-docker /usr/local/bin/nvidia-docker && exit 0