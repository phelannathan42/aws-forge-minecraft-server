#!/bin/bash
sudo apt update && sudo apt install -y openjdk-17-jre-headless awscli unzip screen
mkdir -p forge-server && cd forge-server
wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.2.0/forge-1.19.2-43.2.0-installer.jar
java -jar forge-1.19.2-43.2.0-installer.jar --installServer
aws s3 sync s3://your-bucket-name/mods mods/
