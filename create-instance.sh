#!/bin/bash

MACHINE_NAME=$1
VOLUME_SIZE=$2
INSTANCE_TYPE='p2.xlarge'
AWS_AMI='ami-6c101b0a'

aws_region=$(aws configure get region)

docker-machine create --driver amazonec2 \
	--amazonec2-region $aws_region \
	--amazonec2-ami $AWS_AMI \
	--amazonec2-instance-type $INSTANCE_TYPE \
	--amazonec2-root-size $VOLUME_SIZE \
$MACHINE_NAME

docker-machine ls
docker-machine restart $MACHINE_NAME

sleep 20s

docker-machine ssh $MACHINE_NAME \
"sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub \
&& sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list' \
&& sudo apt-get update && sudo apt-get install -y --no-install-recommends linux-headers-generic dkms cuda-drivers \
&& wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb \
&& sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb"

docker-machine restart $MACHINE_NAME

sleep 20s

source env.sh $MACHINE_NAME

nvidia-docker run --rm nvidia/cuda nvidia-smi
