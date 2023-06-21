#!/usr/bin/bash

curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/Dockerfile > Dockerfile
curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/main.js > main.js

sudo docker build -t demo-app --name demo-app .
 
sudo docker run -it -d -p 80:3000 demo-app
 