#!/bin/bash
# filepath: run_once_install_ansible.sh

set -e

echo "Installing Ansible and dependencies..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    brew install ansible
fi

# Install Ansible collections and roles
echo "Installing Ansible requirements..."
cd ~/.ansible-bootstrap
ansible-galaxy install -r requirements.yml