.PHONY: build tag push rmi clean

DOCKER  = docker
REPO    = ciscocloud
NAME    = nginx-mantlui
VERSION = 0.6.1-pre

build:
	$(DOCKER) build -t $(NAME) .

tag: build
	$(DOCKER) tag -f $(NAME) $(REPO)/$(NAME):latest
	$(DOCKER) tag -f $(NAME) $(REPO)/$(NAME):$(VERSION)

push: tag
	$(DOCKER) push $(REPO)/$(NAME):latest
	$(DOCKER) push $(REPO)/$(NAME):$(VERSION)

rmi:
	$(DOCKER) rmi $(NAME) $(REPO)/$(NAME):latest $(REPO)/$(NAME):$(VERSION) || true

clean: rmi
