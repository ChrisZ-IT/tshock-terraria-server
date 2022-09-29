# Build new base image(first time or when new version comes out)
sudo docker build --tag terraria-tshock --file Dockerfile .

# Start container

  # interactive mode (Run this one on first boot to setup in game user account)
  sudo docker run -it -p 7777:7777 --memory=2048m --mount type=volume,src=terraria,dst=/home/terraria/.local/share/Terraria --name="terraria-vanilla" terraria-tshock:latest

  # non interactive mode
  sudo docker run -p 7777:7777 --memory=2048m --mount type=volume,src=terraria,dst=/home/terraria/.local/share/Terraria --name="terraria-vanilla" terraria-tshock:latest

# Restart container
sudo docker ps -a
sudo docker start <container id>


# TODO:

    Better documentation.
    Better way to pass in variables from the docker run (ie world name, world location, world size on auto creation, player count..etc)
    Get image pushed to docker hub (don't currently have an account there yet)

Special thanks to a few of the other people who have already solved this 'problem' in docker. looking at their Dockerfiles helped me out a lot; I mostly looked at https://github.com/JoshuaTheMiller/Vanilla-Terraria