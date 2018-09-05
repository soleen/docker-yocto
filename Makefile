HOST_GID := $(shell id -g)
HOST_UID := $(shell id -u)
HOST_USER := $(shell id -nu)
HOST_GROUP := $(shell id -ng)

all: build

build:
	docker build -t soleen/yocto .

run:
	docker run -h yocto -e HOST_GID=$(HOST_GID) -e HOST_UID=$(HOST_UID) \
	-e HOST_USER=$(HOST_USER) -e HOST_GROUP=$(HOST_GROUP) -it soleen/yocto

deploy:
	docker push soleen/yocto
