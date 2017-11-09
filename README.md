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

then load environment for created instance:
>source env.sh [instance_name]

# Remove an instante

run
>bash remove-instance.sh [instance_name]
