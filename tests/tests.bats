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
@test "docker version is ${DOCKER_VERSION}" {
    result=$(dk_devbox_cmd "docker version | grep Version | head -n 1 | awk '{ print \$NF }'")
    [[ "$result" == "${DOCKER_VERSION}" ]]
}

# Test docker compose version
@test "docker-compose version is ${DOCKER_COMPOSE_VERSION}" {
    result=$(dk_devbox_cmd "docker-compose --version")
    [[ "$result" == *"docker-compose version ${DOCKER_COMPOSE_VERSION}"* ]]
}

@test "docker-compose build is ok" {
    ls -lisa /app
    dk_devbox_cmd "ls -lisa . && ls -lisa / && pwd && ls -lisa /app && cd tests/docker && docker-compose build"
}

@test "docker-compose up is ok" {
    dk_devbox_cmd "cd tests/docker && docker-compose up"
}
