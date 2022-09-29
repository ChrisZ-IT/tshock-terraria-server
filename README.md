# tshock-terraria-Server
<i>this is a work in progress as I learn docker. So please forgive my sloppyness

Building a new docker image will download the latest version of the tshock server zip file from https://github.com/Pryaxis/TShock/releases </i>

# Build command:
sudo docker build --tag terraria-tshock --file Dockerfile .

# Run container in interactive mode.
Run in interactive mode the first time so you can setup your local in game admin user account.

sudo docker run -it -p 7777:7777 --memory=2048m --mount type=volume,src=terraria,dst=/home/terraria/.local/share/Terraria --name="terraria" terraria-tshock

# Restart this container if it is stopped
sudo docker ps -a
sudo docker start <container−id>

# TODO:
1. Better documentation.
2. Better way to pass in variables from the docker run (ie world name, world location, world size on auto creation, player count..etc)
3. Get image pushed to docker hub (don't currently have an account there yet)

Special thanks to a few of the other people who have already solved this 'problem' in docker. looking at their Dockerfiles helped me out a lot; I mostly looked at https://github.com/JoshuaTheMiller/Vanilla-Terraria
