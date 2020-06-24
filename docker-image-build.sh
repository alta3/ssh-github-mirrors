#!/bin/bash

echo "Building the key-mirror image"

sudo docker build -q --build-arg user=ubuntu   --tag key-mirror ./
