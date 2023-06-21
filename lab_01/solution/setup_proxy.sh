#!/usr/bin/bash



########################################################

## Shell Script to setup nginx revers proxy server   
## Author: Okuta Omeiza
## Date: Jun 21
########################################################


DATE=`date +%Y.%m.%d.%H.%M`

sudo yum install epel-release  
sudo yum update  -y
sudo yum install -y nginx  git
sudo systemctl enable nginx
nginx -v

sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf_orig 

curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/nginx.conf > nginx_config
sudo cp nginx_config /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx