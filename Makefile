all: build

build:
	docker build -t soleen/yocto .

run:
	docker run -it soleen/yocto

deploy:
	docker push soleen/yocto
