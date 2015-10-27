# My devbox Docker image.
#
# VERSION 1.8.3

from debian:jessie

maintainer Alban Montaigu <https://github.com/AlbanMontaigu>

env DEBIAN_FRONTEND noninteractive

# Install Ansible
run apt-get update && \
    apt-get install -y openssh-client ansible && \
    apt-get clean

# Add playbooks to the Docker image
copy ansible /tmp/ansible
workdir /tmp/ansible

# Run Ansible to configure the Docker image
run ansible-playbook playbook.yml -i hosts

# Setup working directory
workdir /home/dev

# Run everything below as the dev user
user dev

# Setup dev user environment
env HOME /home/dev
env PATH $HOME/bin:$PATH
env LANG fr_FR.UTF-8
env LANGUAGE fr_FR:fr
env LC_ALL fr_FR.UTF-8

entrypoint ["/bin/zsh"]
