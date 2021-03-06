#!/bin/bash
set -xeuo pipefail

# install local package
cp /photish/pkg/*x86_64.rpm ~
sudo rpm -e photish || true
sudo rpm -Uh ~/*x86_64.rpm
photish version

# uninstall
sudo rpm -e photish

# download repo file
wget https://bintray.com/henrylawson/rpm/rpm -O bintray-henrylawson-rpm.repo
sudo mv bintray-henrylawson-rpm.repo /etc/yum.repos.d/

# install package
sudo yum install -y photish.x86_64
photish version
