docker-yocto
=================

## About

This repo contains docker image for building the yocto images.

Use the script [yocto-build](https://raw.githubusercontent.com/soleen/docker-yocto/master/yocto-build) to switch yocto building environment and use docker to build the [Yocto project](https://www.yoctoproject.org) instad of installing ubuntu in a VM.

## Setting up

First download the [yocto-build](https://raw.githubusercontent.com/soleen/docker-yocto/master/yocto-build) as `~/bin/yocto-build`

```sh
mkdir -p ~/bin
curl https://raw.githubusercontent.com/soleen/docker-yocto/master/yocto-build > ~/bin/yocto-build
chmod +x ~/bin/yocto-build
```

Add following line to the `~/.bashrc` file to ensure that the `~/bin` folder is in you PATH variable.

```sh
export PATH=~/bin:$PATH
```

## Basic Usage

First time to use the `yocto-build` command, you need to tell it where is the workdir we build the yocto image.

For example, if I want to build yocto at `/home/soleen/poky` then:

```sh
yocto-build --workdir /home/soleen/poky
```

After this command, we'll create a container named `yocto-build`, which is the environment we used to build the yocto image.
Now you'll find your current shell is switch to the container and the `/home/soleen/poky` is mounted to `/yocto`.

## Spawn a new shell

If you want to spawn a new shell in another terminal, you can use

```sh
yocto-build --shell
```

This will spawn a new shell if you already specify a workdir.

## Remove the container

This script only support *ONLY ONE CONTAINER*, so If you want to change the workdir, you should remove it first, remove a container is easy, just use following command:

```sh
yocto-build --rm
```

Then you can setup a new workdir you want.

## Upgrade script

Upgrade this script is easy, just type

```sh
yocto-build --upgrade
```

## Pull new docker container

To pull new docker image, just type

```sh
yocto-build --pull
```
