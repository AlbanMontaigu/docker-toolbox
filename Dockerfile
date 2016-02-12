# ==================================================================================================
# 
# DOCKER DEVBOX
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
# 3.3 last version as per 2016-02-06
from alpine:3.3

# Maintainer
maintainer Alban Montaigu <https://github.com/AlbanMontaigu>

# Root user
USER root
WORKDIR /root

# Environment configuration
ENV DOCKER_VERSION="1.10.1" \
    DOCKER_COMPOSE_VERSION="1.6.0"

# System preparation and setup
RUN apk add --update zsh curl git perl openssh-client py-pip py-yaml \
                        make m4 mercurial vim docker-vim nano \

# Install docker bin for client commands (will be connected to docker host daemon)
    && curl -fSL "https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}" -o /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker \

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

# Docker entrypoint is zsh
entrypoint ["/bin/zsh"]
