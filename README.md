# ssh-github-mirrors

This project sets up a key-mirror inside of a docker container.

## Running the mirror

1. Edit the **github_users.txt** file to include all of the users you wish to get the public keys for from GitHub
2. Run the **setup.sh** script

    `./setup.sh`

## Design considerations
1. The cron task to update the keys is setup in the **setup.sh** script to run every 10 minutes. GitHub has a limit of 60 API calls per hour. Therefore, you can have up to 6 users automatically updated on this schedule. If you need to have more users you will need to decrease the frequency, or make the request from another IP address.
0. When you want to update the users, simply change the **github_users.txt** file. The cron job to push this file occurs every minute.
0. If you want to force the mirror to push the **github_users.txt** file and run the update, run the **update_keys_now.sh** script.

## Teardown
1. To get a fresh slate, you can simply run the **teardown.sh** script.
    
    `./teardown.sh`

## Pull Requests
If you wish to contribute to this project, we are very open to PRs. Here is a list of our current needs:

1. Allow users to have the mirror authenticate with GitHub using OAuth tokens.
0. Improved Documentation
0. Self-Hosted Key Server (on the mirror)
