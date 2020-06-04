
#./docker-server-setup.sh

echo "* * * * * $USER sudo docker cp github_users.txt ssh-github-key-mirror:/home/ubuntu/github_users.txt" >> ssh-github-mirror-cron
echo "/2 * * * * $USER sudo docker exec ssh-github-key-mirror  /usr/bin/python3.8 /home/ubuntu/ssh-copy-id-from-github.py -j all" >> ssh-github-mirror-cron

sudo cp ssh-github-mirror-cron /etc/cron.d/ssh-github-mirror-cron

