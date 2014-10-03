image_name     = shared_terminal_workshops/sandbox
version        = latest
container_name = sandbox

DOCKER_TARGETS = .docker-targets

.PHONY:	build run stop distclean clean-image

run:	$(DOCKER_TARGETS)/image
	docker run -t -i --rm \
        --name=$(container_name) $(image_name):$(version)

build:	$(DOCKER_TARGETS)/image

distclean:	clean-image
	-rmdir $(DOCKER_TARGETS)

$(DOCKER_TARGETS)/image:	Dockerfile exercises
	docker build -t $(image_name):$(version) .
	@mkdir -p $(DOCKER_TARGETS) && touch $(DOCKER_TARGETS)/image

clean-image:
	-docker rmi $(image_name):$(version) && rm -f $(DOCKER_TARGETS)/image
