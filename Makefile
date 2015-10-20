DOCKER  = docker
REPO    = ciscocloud
NAME    = nginx-mantlui
VERSION = 0.2

all: build tag push

build:
	$(DOCKER) build -t $(NAME) .

tag:
	$(DOCKER) tag -f $(NAME) $(REPO)/$(NAME):latest
	$(DOCKER) tag -f $(NAME) $(REPO)/$(NAME):$(VERSION)

push:
	$(DOCKER) push $(REPO)/$(NAME):latest
	$(DOCKER) push $(REPO)/$(NAME):$(VERSION)

rmi:
	$(DOCKER) rmi $(NAME) $(REPO)/$(NAME):latest $(REPO)/$(NAME):$(VERSION) || true

clean: rmi
