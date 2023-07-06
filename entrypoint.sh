#!/bin/bash

sudo apt update -y && sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo docker run -p 80:80 nginx
