# This dockerfile uses the ubuntu image
# VERSION 0 - EDITION 1
# Author:  Yen-Chin, Lee <yenchin@weintek.com>
# Command format: Instruction [arguments / command] ..

FROM ubuntu:16.04
MAINTAINER Pavel Tatashin

# http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html
# Update package infos first
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
   apt-utils dialog locales gawk wget git-core diffstat unzip texinfo \
   gcc-multilib build-essential chrpath socat cpio python python3 python3-pip \
   python3-pexpect xz-utils debianutils iputils-ping vim bc g++-multilib \
   libsdl1.2-dev xterm make xsltproc docbook-utils fop dblatex xmlto python-git \
   sed cvs subversion coreutils texi2html python-pysqlite2 help2man  gcc g++ \
   desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf \
   automake groff curl lzop asciidoc u-boot-tools ssh sudo file

# Set the locale, else yocto will complain
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# default workdir is /yocto
WORKDIR /yocto

# Add entry point, we use entrypoint to mapping host user to
# container
COPY ./entrypoint /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
