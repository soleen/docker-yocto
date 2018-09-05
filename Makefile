HOST_GID := $(shell id -g)
HOST_UID := $(shell id -u)
HOST_USER := $(shell id -nu)

all: build

build:
	docker build -t soleen/yocto .

run:
	docker run -e HOST_GID=$(HOST_GID) -e HOST_UID=$(HOST_UID) -e HOST_USER=$(HOST_USER) -e -it soleen/yocto

deploy:
	docker push soleen/yocto
