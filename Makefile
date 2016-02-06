.PHONY: build tests all

DOCKER_IMAGE_NAME=amontaigu/docker-devbox
DOCKER_VERSION="1.10.0"
DOCKER_COMPOSE_VERSION="1.6.0"

all: build test

build:
	docker build --tag $(DOCKER_IMAGE_NAME) .

run:
	docker run -ti --rm \
			-v /var/run/docker.sock:/var/run/docker.sock \
			-v $(CURDIR):/workspace \
			$(DOCKER_IMAGE_NAME)

tests:
	docker run \
		-v $$(which docker):$$(which docker) \
		-v /var/run/docker.sock:/docker.sock \
		-v $(CURDIR):/app \
		-w="/app/tests" \
		-e DOCKER_HOST_CURDIR=$(CURDIR) \
		-e DOCKER_HOST="unix:///docker.sock" \
		-e DOCKER_IMAGE_NAME=$(DOCKER_IMAGE_NAME) \
		-e DOCKER_VERSION=$(DOCKER_VERSION) \
		-e DOCKER_COMPOSE_VERSION=$(DOCKER_COMPOSE_VERSION) \
		dduportal/bats:0.4.0
