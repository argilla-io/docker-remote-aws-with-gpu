# docker-remote-aws-with-gpu
Configures an docker-machine remote environment with amazonec2 driver

# Prerequisites

* Configured aws command-cli 

>pip install awscli --upgrade --user && aws configure

* docker-machine commmand

# Initial configuration

run 
>bash init.sh

# Create an instance and links with docker client

run
>bash create-instance.sh [instance_name] [volume_size]
