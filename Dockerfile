FROM ubuntu:18.04

RUN apt-get update && apt-get -qqy install cron python3.8 python3-pip 

# Copy the cron-file
COPY ssh-github-mirror-cron /etc/cron.d/ssh-github-mirror-cron

# Copy the script and dependencies
COPY $PWD/ssh-github-mirror.py /home/ubuntu/ssh-github-mirror.py
COPY $PWD/ssh-copy-id-from-github.py /home/ubuntu/ssh-copy-id-from-github.py
COPY $PWD/requirements.txt /home/ubuntu/requirements.txt
COPY $PWD/routes.py /home/ubuntu/routes.py
COPY $PWD/views.py /home/ubuntu/views.py
COPY $PWD/keyfile.gh /home/ubuntu/keyfile.gh
COPY $PWD/github_users.txt /home/ubuntu/github_users.txt
COPY $PWD/lib /home/ubuntu/lib
# Perform the setup

# Prepare to run the cron job
RUN chmod 0644 /etc/cron.d/ssh-github-mirror-cron
RUN mkdir /home/ubuntu/log
# Run cron and tail the server output
EXPOSE 22345

RUN /usr/bin/python3.8 -m pip install -r /home/ubuntu/requirements.txt
CMD cron && /usr/bin/python3.8 /home/ubuntu/ssh-github-mirror.py
