#!/bin/bash
echo "Setting up the cron jobs"
FILE="ssh-github-mirror-cron"
if test -f "$FILE"; then
       rm ssh-github-mirror-cron
fi
echo "* * * * * $USER sudo docker cp $PWD/github_users.txt ssh-github-key-mirror:/home/ubuntu/github_users.txt" >> ssh-github-mirror-cron
echo "*/15 * * * * $USER sudo docker exec ssh-github-key-mirror  /usr/bin/python3.8 /home/ubuntu/ssh-copy-id-from-github.py -j all" >> ssh-github-mirror-cron
sudo cp ssh-github-mirror-cron /etc/cron.d/ssh-github-mirror-cron

echo "Creating the Docker Image"
./docker-server-setup.sh

echo "Your mirror is set up"
echo
echo "You can reach your mirror at 10.10.2.2:23456/users/{username}/keys"
