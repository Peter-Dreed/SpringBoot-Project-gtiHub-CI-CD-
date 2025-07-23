#!/bin/bash
set -euxo pipefail

# Update package index
apt-get update -y

# Install Java 17
apt-get install -y openjdk-17-jdk

# Install Maven
apt-get install -y maven

# Install Git
apt-get install -y git

# Install Docker dependencies
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Create directory for application
mkdir -p /opt/springboot

echo "Spring Boot environment setup completed" > /var/log/springboot-setup.log