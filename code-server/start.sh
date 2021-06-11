#!/bin/bash
mkdir -p ~/.vsconfig
exposehost='0.0.0.0'
docker run -it --rm --name code-server -p ${exposehost}:8080:8080 \
	-v "$HOME/.vsconfig:/home/coder/.config" \
	-v "$PWD:/home/coder/project" \
	-u "$(id -u):$(id -g)" \
	-e "DOCKER_USER=$USER" \
	-e "PASSWORD=123456" \
	codercom/code-server:latest
