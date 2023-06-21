#!/usr/bin/bash



########################################################

## Shell Script to Build Docker Image   
## Author: Okuta Omeiza
## Date: Jun 21
########################################################


DATE=`date +%Y.%m.%d.%H.%M`
IMG_NAME=`demo-app`

sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce docker-ce-cli containerd.io git -y
sudo usermod -aG docker ${USER}
newgrp docker
sudo systemctl status docker
sudo systemctl enable docker
sudo systemctl restart docker


# Delete any existing image
result=$( sudo docker images -q $IMG_NAME )
if [[ -n "$result" ]]; then
echo "image exists"
sudo docker rmi -f $IMG_NAME
else
echo "No such image"
fi
 
# Get script and build a new image
curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/main.js > main.js
curl https://github.com/Stonnystone/devops_aws_ci_lab/blob/main/lab_01/solution/Dockerfile > Dockerfile

 
echo "build the docker image"
sudo docker build -t $IMG_NAME:$DATE . >> output
echo "built docker images and proceeding to delete existing container"
result=$( docker ps -q -f name=$IMG_NAME )
if [[ $? -eq 0 ]]; then
echo "Container exists"
sudo docker container rm -f $IMG_NAME
echo "Deleted the existing docker container"
else
echo "No existing container"
fi

echo "Deploying the updated container"
sudo docker run -itd -p 3000:3000 --name $IMG_NAME $OUTPUT
echo "Deploying the container"
