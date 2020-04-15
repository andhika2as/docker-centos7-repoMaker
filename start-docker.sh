#!/bin/bash


mkdir home
mkdir logFile
docker-compose pull
docker-compose create 
docker-compose start &
cp example-install.sh home/
sleep 5
docker ps
echo "Open readme.md for more"
read -p "Continue enter container bash? (y/N) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
   docker exec -ti $(docker ps -lq) /bin/bash
else
   echo "Skipping entering container bash"
fi