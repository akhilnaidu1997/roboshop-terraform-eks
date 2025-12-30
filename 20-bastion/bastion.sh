#!/bin/bash

sudo growpart /dev/xvda 4
sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home

echo ">>> Installing Docker..."
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable --now docker
usermod -aG docker ec2-user

### -------------------------------
### 3. Install kubectl
### -------------------------------
echo ">>> Installing kubectl..."
KUBECTL_VERSION="1.34.2"
curl -LO "https://s3.us-west-2.amazonaws.com/amazon-eks/${KUBECTL_VERSION}/2025-11-13/bin/linux/amd64/kubectl"

chmod +x kubectl
mkdir -p /usr/local/bin
mv kubectl /usr/local/bin/kubectl

### -------------------------------
### 4. Install eksctl
### -------------------------------
echo ">>> Installing eksctl..."
ARCH="amd64"
PLATFORM="$(uname -s)_${ARCH}"

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp
install -m 0755 /tmp/eksctl /usr/local/bin

rm -f eksctl_${PLATFORM}.tar.gz /tmp/eksctl
