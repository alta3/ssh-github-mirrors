echo "Cleaning up your key-mirror"
sudo docker stop ssh-github-key-mirror
sudo docker network rm key-mirror-net
sudo docker image rm key-mirror -f
sudo rm /etc/cron.d/ssh-github-mirror-cron
