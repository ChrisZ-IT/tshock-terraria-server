# Gets current mono:slim image
FROM mono:latest

# Creates staging scratch folder
RUN mkdir /staging

# Installs any pending updates and installs curl, wget and unzip
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install curl wget unzip -y

# Copies download.sh script
COPY download.sh /staging

# Set script perms to exacute and runs it
RUN chmod 500 /staging/download.sh
RUN /staging/download.sh

# Exposes Terraria's default server port
EXPOSE 7777

# Copies start up script to image
COPY start.sh /usr/local/bin/

# New username argument
ARG TERRARIA_USER_NAME=terraria

# Creates new terraria server service account
RUN adduser --system --group $TERRARIA_USER_NAME

# Sets permissions on required TS server files
RUN chown -R $TERRARIA_USER_NAME /terraria-sesrver && \
    chown    $TERRARIA_USER_NAME /usr/local/bin/start.sh && \
    chmod 700 /terraria-sesrver/TerrariaServer.exe && \
    chmod -R u+rw /terraria-sesrver/ && \
    chmod 500 /usr/local/bin/start.sh

# Allow for external data
#VOLUME ["/terraria-sesrver/world"]

#Set working directory to server
WORKDIR /terraria

# Sets default user
USER terraria

# # run the start script, which will set the password if provided and then run Terraria
ENTRYPOINT ["start.sh"]