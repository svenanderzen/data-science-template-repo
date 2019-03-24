################################################################################
#
# Makefile for starting a fresh Docker container with JupyterLab
#   - interactive/tty: run in foreground and allocate a console
#   - rm: delete the container upon shutdown
#   - publish: bind the ports required for JupyterLab
#   - user/env: specify the uid/gid for mounting host volumes
#   - volume: mount the current working directory
#
# Available on: 
#   https://gist.github.com/svenanderzen/c4635a559d447fce588280c9b9bbf20f
#
# Sven Anderzén
#
################################################################################

IMAGE=jupyter/datascience-notebook

run:
	docker run \
		--interactive \
		--tty \
		--rm \
		--publish 127.0.0.1:8888:8888 \
		--user root \
		--env NB_UID=$(shell id -u) \
		--env NB_GID=$(shell id -g) \
		--env GRANT_SUDO=yes \
		--volume $(shell pwd):/home/jovyan:Z \
		$(IMAGE) start.sh jupyter lab 
