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

# Test docker compose version
@test "With no cmd/args, docker-compose version should be ${DOCKER_COMPOSE_VERSION}" {
    result=$(dk_cmd ${DOCKER_IMAGE_NAME} "docker-compose --version")
    [[ "$result" == *"docker-compose version ${DOCKER_COMPOSE_VERSION}"* ]]
    echo "-$result-"
}

# Test docker version
@test "Docker version shloud be  ${DOCKER_VERSION}" {
    result=$(dk_cmd ${DOCKER_IMAGE_NAME} "docker version" | grep Version | head -n 1 | awk '{ print $NF }')
    [ "$result" eq " ${DOCKER_VERSION}" ]
    echo "-$result-"
}

