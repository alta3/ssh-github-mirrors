# ssh-github-mirrors

This project sets up a key-mirror inside of a docker container, and makes the mirror available on your host IP address, port 23456.

## Running the mirror

1. Clone the Repo:

    `git clone git@github.com:alta3/ssh-github-mirrors`

    or 

    `git clone https://github.com/alta3/ssh-github-mirrors`


2. Change into the repo directory
 
    `cd ssh-github-mirrors`

3. Edit the **github_users.txt** file to include all of the users you wish to get the public keys for from GitHub

    `vim github_users.txt`

    ```
    sgrifith3 bryfry
    ```  

4. Run the **setup.sh** script

    `./setup.sh`



## Using the key-mirror

Now that you have started your mirror, it is time to use it!

You can access this mirror from your local machine by using any of the following IP addresses:
- `10.10.2.2`
- `127.0.0.1`
- `<Your Machine's IP Address>`

If you are attempting to connect to the mirror from a different host on the same network, you can only use `<Your Machine's IP Address>`.

1. Prepare your machine:
    - `sudo apt install python3.8 `
    - `python3.8 -m pip install aiohttp dataclasses_jsonschema`

2. Run the `ssh-copy-id-from-github.py` script (make sure to use the correct **IP ADDRESS**):
    - Dry Run:
        - `python3.8 ssh-copy-id-from-github.py -m <IP_ADDRESS> -O <user1> <user2> <...>`
    - Actually updating your ~/.ssh/authorized_keys file!!! **WARNING: DANGER: YOU-BETTER-KNOW-WHAT-YOU-ARE-DOING** # We assume NO LIABILITY for you using our code, as far as applicable laws allow.
        - `python3.8 ssh-copy-id-from-github.py <user1> <user2> <...>`

## Teardown
1. To get a fresh slate, you can simply run the **teardown.sh** script.
    
    `./teardown.sh`

## Design considerations
1. The cron task to update the keys is setup in the **setup.sh** script to run every 10 minutes. GitHub has a limit of 60 API calls per hour. Therefore, you can have up to 6 users automatically updated on this schedule. If you need to have more users you will need to decrease the frequency, or make the request from another IP address.
0. When you want to update the users, simply change the **github_users.txt** file. The cron job to push this file occurs every minute.
0. If you want to force the mirror to push the **github_users.txt** file and run the update, run the **update_keys_now.sh** script.

## Pull Requests
If you wish to contribute to this project, we are very open to PRs. Here is a list of our current needs:

1. Allow users to have the mirror authenticate with GitHub using OAuth tokens.
0. Improved Documentation
0. Self-Hosted Key Server (on the mirror)
