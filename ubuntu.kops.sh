#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
apt update -y && apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

#based on server region take the region ubuntu ami id and it will work
export KOPS_STATE_STORE=s3://vhsveeuvervuvebyr-565467.k8s.local
kops create cluster --name rahamss.k8s.local --zones us-east-1b --control-plane-image ami-0ecb62995f68bb549  --control-plane-count=1 --control-plane-size c7i-flex.large --image ami-0ecb62995f68bb549  --node-count=2 --node-size c7i-flex.large
kops update cluster --name rahamss.k8s.local --yes --admin
