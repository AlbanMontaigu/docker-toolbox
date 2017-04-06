# ==================================================================================================
# 
# DOCKER TOOLBOX
#
# A friendly light docker image to provide tools and configuration to
# work in a confortable manner with docker
# 
# @see https://pkgs.alpinelinux.org
# @see http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
# @see https://github.com/buildkite/docker-buildkite-agent/blob/master/alpine/Dockerfile
#
# ==================================================================================================

# Base image
# 3.5 last version as per 2017-01-29
FROM alpine:3.5

# Maintainer
MAINTAINER Alban Montaigu <https://github.com/AlbanMontaigu>

# Root user
USER root
WORKDIR /root

# Environment configuration
ENV DOCKER_VERSION="17.03.0-ce" \
    DOCKER_COMPOSE_VERSION="1.12.0" \
    DKTB_EXTENSION_DIR="/opt/docker-toolbox-extension"

# System preparation and setup
RUN apk add --update zsh zsh-vcs curl git perl openssh-client py-pip py-yaml \
                        make m4 mercurial vim docker-vim nano \

# Install docker bin for client commands (will be connected to docker host daemon)
    && curl -fSL "https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && tar xvzf docker.tgz \
    && mv -fv docker/docker /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker \
    && rm -rvf docker* \

# Install docker compose
    && pip install -U pip docker-compose==$DOCKER_COMPOSE_VERSION \

# Root default shell is now zsh
    && sed -ri 's;^(root:x:0:0:root:/root:)/bin/ash;\1/bin/zsh;' /etc/passwd \
    && mkdir -p /root/.zshrc.d \

# Final cleaning
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* /root/.cache

# Zsh configuration file
ADD ./zsh/.zshrc /root/
ADD ./zsh/.zshrc.d/* /root/.zshrc.d/

# Volumes definitions (usefull for volumes from for example)
VOLUME ["/vagrant/", "/opt/docker-toolbox-extension"]

# Docker entrypoint is zsh
entrypoint ["/bin/zsh"]
