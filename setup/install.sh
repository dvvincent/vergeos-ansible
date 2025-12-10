#!/bin/bash
# Install Ansible and VergeOS Collection

echo "Installing Ansible..."
sudo apt-get update
sudo apt-get install -y ansible

echo "Installing VergeOS Collection..."
# Clone the collection (using main branch or specific tag)
git clone https://github.com/verge-io/ansible-collection-vergeos.git /tmp/ansible-collection-vergeos

# Build and Install
cd /tmp/ansible-collection-vergeos
ansible-galaxy collection build
ansible-galaxy collection install vergeio-vergeos-*.tar.gz

echo "Installation Complete!"
ansible-galaxy collection list vergeio.vergeos
