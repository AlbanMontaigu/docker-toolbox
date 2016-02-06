#!/usr/bin/env bats

# =======================================================================
#
# Testing the project
#
# @see https://github.com/sstephenson/bats
# @see https://blog.engineyard.com/2014/bats-test-command-line-tools
#
# =======================================================================

# Loads common features for test
load tests_helper

# Test docker version
@test "Docker version shloud be ${DOCKER_VERSION}" {
    result=$(dk_devbox_cmd "docker version | grep Version | head -n 1 | awk '{ print \$NF }'")
    [[ "$result" == "${DOCKER_VERSION}" ]]
}

# Test docker compose version
@test "Docker-compose version should be ${DOCKER_COMPOSE_VERSION}" {
    result=$(dk_devbox_cmd "docker-compose --version")
    [[ "$result" == *"docker-compose version ${DOCKER_COMPOSE_VERSION}"* ]]
}

@test "Image build with docker-compose" {
    cd /app/tests/docker
    dk_devbox_cmd "docker-compose build"
}

@test "Stack up with docker-compose" {
    cd /app/tests/docker
    dk_devbox_cmd "docker-compose up"
}
