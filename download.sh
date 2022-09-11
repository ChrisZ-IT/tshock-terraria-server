#!/bin/bash

# Downloads the latest TShock Terraria server files from github
location=$(curl -s "https://api.github.com/repos/Pryaxis/TShock/releases/latest" \
| grep "browser_download_url" \
| awk '{print substr($2, 2, length($2)-2)}')
wget -O tshock.zip $location -P /terraria-sesrver

# extacts linux server files
unzip /terraria-sesrver/tshock.zip && \
rm -rf /terraria-sesrver/tshock.zip

