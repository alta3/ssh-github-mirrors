FROM ubuntu:18.04

RUN apt-get update && apt-get -qqy install cron python3.8

# Copy the cron-file
COPY ssh-github-mirror-cron /etc/cron.d/ssh-github-mirror-cron

# Copy the script and dependencies
COPY $PWD/ssh-github-mirror.py /home/ubuntu/ssh-github-mirror.py
COPY $PWD/requirements.txt /home/ubuntu/requirements.txt
COPY $PWD/routes.py /home/ubuntu/routes.py
COPY $PWD/views.py /home/ubuntu/views.py
COPY $PWD/setup.sh /home/ubuntu/setup.sh
COPY $PWD/keyfile.gh /home/ubuntu/keyfile.gh

# Perform the setup
CMD /home/ubuntu/setup.sh

# Prepare to run the cron job
RUN chmod 0644 /etc/cron.d/ssh-github-mirror-cron
RUN touch /var/log/cron.log

# Run cron and tail the output
CMD cron && tail -f /var/log/cron.log

EXPOSE 22345
CMD /usr/bin/python3.8 /home/ubuntu/ssh-github-mirror.py

