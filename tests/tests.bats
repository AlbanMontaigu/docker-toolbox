#!/usr/bin/env bats

@test "With no cmd/args, docker-compose version should be ${DOCKER_COMPOSE_VERSION}" {
    result="$(docker run ${DOCKER_IMAGE_NAME} docker-compose --version)"
    [[ "$result" == *"docker-compose version ${DOCKER_COMPOSE_VERSION}"* ]]
    echo "-$result-"
}
