#!/usr/bin/env bats

@test "With no cmd/args, docker-compose version should be ${DOCKER_COMPOSE_VERSION}" {
    result="$(docker-compose version)"
    [[ "$result" == *"docker-compose version ${DOCKER_COMPOSE_VERSION}"* ]]
    echo "-$result-"
}

@test "Docker compose build test" {
    cd /app/tests/docker
    docker-compose build
}

@test "Docker compose up test" {
    cd /app/tests/docker
    docker-compose up
}
