SHELL = /bin/bash

CONTEINER_NAME := apt-repo
DOCKER_IMAGE_TAG := $(CONTEINER_NAME):latest

.PHONY: rebuild build

rebuild:
	docker build --rm $(DOCKER_BUILD_NO_CACHE) -t $(DOCKER_IMAGE_TAG) .

build: DOCKER_BUILD_NO_CACHE:=
build: rebuild;

run:
	docker run --rm -it -v ${PWD}/data:/var/www/html/repo -p 80:80 --name $(CONTEINER_NAME) $(DOCKER_IMAGE_TAG) /main.sh

shell:
	docker run --rm -it -v ${PWD}/data:/var/www/html/repo -p 80:80 --name $(CONTEINER_NAME) $(DOCKER_IMAGE_TAG) /bin/bash