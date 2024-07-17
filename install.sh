#!/bin/bash
apt update & apt upgrade
apt install tmux
wget https://maven.neoforged.net/releases/net/neoforged/neoforge/20.4.237/neoforge-20.4.237-installer.jar
wget https://github.com/AuroraTeam/ServerWrapper/releases/download/v1.1.0/sw_linux
java -jar neoforge-20.4.237-installer.jar --installServer
rm -r neoforge-20.4.237-installer.jar
rm -r run.bat
rm -r neoforge-20.4.237-installer.jar.log

chmod +x /workspaces/MC-server/libraries/net/neoforged/neoforge/20.4.237/unix_args.txt
mv /workspaces/MC-server/libraries/net/neoforged/neoforge/20.4.237/unix_args.txt /workspaces/MC-server/

