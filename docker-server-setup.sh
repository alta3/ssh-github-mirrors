#!/bin/bash

echo "Building the key-mirror"

sudo docker network create --opt com.docker.network.driver.mtu=1450 --subnet 10.10.2.0/24 key-mirror-net
echo Network built

wget https://static.alta3.com/images/key-mirror.tar
sudo docker load < key-mirror.tar
echo Image built

sudo docker run --rm -d --name ssh-github-key-mirror -p 23456:23456 -h ssh-key-mirror --ip 10.10.2.2 --network key-mirror-net key-mirror
echo "The Key Mirror is Ready!"
