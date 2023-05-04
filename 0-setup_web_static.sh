#!/usr/bin/env bash
# Script that configures Nginx server with some folders and files
sudo apt-get -y update
sudo apt-get -y install nginx
sudo service nginx stop
sudo service nginx start
sudo mkdir -p /data/
sudo chown -R ubuntu:ubuntu /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
echo "Holberton School" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\n\tlocation \/hbnb_static\/ {\n\t\talias  \/data\/web_static\/current\/;\n\t\tautoindex off;\n\t}/" /etc/nginx/sites-enabled/default
sudo service nginx restart
exit 0
