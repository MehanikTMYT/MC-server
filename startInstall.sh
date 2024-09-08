#!/bin/bash

# Устанавливаем pyngrok
echo "Installing pyngrok..."
pip install pyngrok

# Устанавливаем OpenJDK 21
echo "Installing OpenJDK 21..."
if ! dpkg -l | grep -q openjdk-21-jdk; then
  sudo apt update
  sudo apt install -y openjdk-21-jdk
else
  echo "OpenJDK 21 is already installed."
fi

# Запускаем установщик NeoForge
NEOFORGE_INSTALLER="neoforge-21.1.42-installer.jar"
echo "Running NeoForge installer..."
if [ -f "$NEOFORGE_INSTALLER" ]; then
  java -jar $NEOFORGE_INSTALLER --installServer
  rm $NEOFORGE_INSTALLER
else
  echo "Installer $NEOFORGE_INSTALLER not found!"
  exit 1
fi

# Перемещаем файл unimx_args.txt
echo "Moving unix_args.txt..."
UNIX_PATH="./libraries/net/neoforged/neoforge/21.1.42/unix_args.txt"
if [ -f "$UNIX_PATH" ]; then
  mv $UNIX_PATH ./
else
  echo "File $UNIX_PATH not found!"
  exit 1
fi

echo "All tasks completed successfully!"
