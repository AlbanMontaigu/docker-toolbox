.PHONY: build test all

DOCKER_IMAGE_NAME=amontaigu/docker-devbox
DOCKER_VERSION="1.10.0"
DOCKER_COMPOSE_VERSION="1.6.0"

all: build test

build:
	docker build --tag $(DOCKER_IMAGE_NAME) .

run:
	docker run -v "$(pwd)":/workspace \
			-v /var/run/docker.sock:/var/run/docker.sock \
			-ti --rm \
		$(DOCKER_IMAGE_NAME)

tests:
	docker run \
		-v $(CURDIR):/app \
		-v $$(which docker):$$(which docker) \
		-v /var/run/docker.sock:/docker.sock \
		-e DOCKER_IMAGE_NAME=$(DOCKER_IMAGE_NAME) \
		-e DOCKER_VERSION=$(DOCKER_VERSION) \
		-e DOCKER_COMPOSE_VERSION=$(DOCKER_COMPOSE_VERSION) \
		dduportal/bats:0.4.0 \
			/app/tests/
