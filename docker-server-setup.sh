#!/bin/bash

echo "Building the key-mirror"

sudo docker network create --opt com.docker.network.driver.mtu=1450 --subnet 10.10.1.0/24 key-mirror-net

sudo docker build -q --build-arg user=ubuntu   --tag key-mirror docker/

sudo docker run -d --name ssh-key-mirror -h ssh-key-mirror --ip 10.10.1.2 --network key-mirror-net

echo "The Key Mirror is Ready!"
