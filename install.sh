#!/bin/bash

curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update
sudo apt install -y playit

wget https://maven.neoforged.net/releases/net/neoforged/neoforge/20.4.237/neoforge-20.4.237-installer.jar
java -jar neoforge-20.4.237-installer.jar --installServer
rm -r neoforge-20.4.237-installer.jar
rm -r run.bat
rm -r neoforge-20.4.237-installer.jar.log

chmod +x /workspaces/MC-server/libraries/net/neoforged/neoforge/20.4.237/unix_args.txt
mv /workspaces/MC-server/libraries/net/neoforged/neoforge/20.4.237/unix_args.txt /workspaces/MC-server/

