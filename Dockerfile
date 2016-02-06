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
ENV DOCKER_VERSION="1.10.0-r0" \
    DOCKER_COMPOSE_VERSION="1.6.0"

# System preparation and setup
RUN apk add --update zsh docker-$DOCKER_VERSION docker-zsh-completion-$DOCKER_VERSION


# Final cleaning
    && rm -rf /var/cache/apk/*


# Docker entrypoint is zsh
entrypoint ["/bin/zsh"]
