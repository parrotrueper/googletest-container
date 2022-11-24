# Docker Image to build this project in a container.
# Build it like so:
# $ ./build-container.sh
#
# Once the image is build invoke the container with the script
# $ ./run-container.sh
#
FROM ubuntu:focal

USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        git-core \
        build-essential \
        python \
        python3 \
        python3-pip \
        python3-pexpect \
        locales \
        sudo \
        python3-git \
        python3-jinja2 \
        libegl1-mesa \
        libsdl1.2-dev \
        libglib2.0-dev \
        cmake \
        pylint3 \
        python3-pip \
        xterm \
        iproute2 \
        fluxbox \
        tightvncserver \
        lz4 \
        gcc-multilib \ 
        g++-multilib \
        ninja-build \
        zstd \
        curl

# clear out the cache
RUN apt-get clean

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo
RUN chmod a+rx /usr/bin/repo

# For ubuntu, do not use dash.
RUN which dash &> /dev/null && (\
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash) || \
    echo "Skipping dash reconfigure (not applicable)"

# Add the user gtester
RUN useradd --create-home --shell /bin/bash gtester && \
    /usr/sbin/locale-gen en_US.UTF-8


# Set as default user
USER gtester
WORKDIR /home/gtester


ENV LANG=en_US.UTF-8

# docker build -t gtest .
