#/bin/bash

sudo pacman -S redis
sudo systemctl enable redis.service
sudo systemctl start redis.service

