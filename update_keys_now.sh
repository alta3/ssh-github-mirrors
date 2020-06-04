echo "Updating Keys from Github"
sudo docker cp $PWD/github_users.txt ssh-github-key-mirror:/home/ubuntu/github_users.txt
sudo docker exec ssh-github-key-mirror  /usr/bin/python3.8 /home/ubuntu/ssh-copy-id-from-github.py -j all
