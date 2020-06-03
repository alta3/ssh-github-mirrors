#!/bin/bash

echo "Building the key-mirror"

sudo docker network create --opt com.docker.network.driver.mtu=1450 --subnet 10.10.2.0/24 key-mirror-net

sudo docker build -q --build-arg user=ubuntu   --tag key-mirror docker/

sudo docker run -d --name ssh-github-key-mirror -h ssh-key-mirror --ip 10.10.2.2 --network key-mirror-net key-mirror

echo "The Key Mirror is Ready!"
