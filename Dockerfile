# ==================================================================================================
# 
# DOCKER DEVBOX
#
# A friendly light docker image to provide tools and configuration to
# work in a confortable manner with docker
# 
# @see https://pkgs.alpinelinux.org/package
# @see http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management#Update_the_Package_list
#
# ==================================================================================================


# Base image
# 3.3 last version as per 2016-02-06
from alpine:3.3


# Maintainer
maintainer Alban Montaigu <https://github.com/AlbanMontaigu>


# Environment configuration
ENV DOCKER_VERSION="1.10.0" \
    DOCKER_URL=" https://get.docker.com/builds/Linux/x86_64/docker" \
    DOCKER_COMPOSE_VERSION="1.6.0" \
    DOCKER_COMPOSE_URL="https://github.com/docker/compose/releases/download"


# System preparation and setup
RUN apk add --update zsh curl \

# Install docker bin for client commands (will be connected to docker host daemon)
    && curl -fSL "${DOCKER_URL}-${DOCKER_VERSION}" -o /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker \

# Final cleaning
    && rm -rf /var/cache/apk/*


# Docker entrypoint is zsh
entrypoint ["/bin/zsh"]
