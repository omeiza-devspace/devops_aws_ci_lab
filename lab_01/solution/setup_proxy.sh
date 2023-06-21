#!/usr/bin/bash
sudo yum install epel-release  
sudo yum update  -y
sudo yum install -y nginx  git
sudo systemctl enable nginx
sudo systemctl restart nginx
nginx -v
