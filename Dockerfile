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
        zstd

RUN apt-get clean

#COPY gtester-launch.sh /usr/bin

# For ubuntu, do not use dash.
RUN which dash &> /dev/null && (\
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash) || \
    echo "Skipping dash reconfigure (not applicable)"

# Add the user gtester
RUN useradd --create-home --shell /bin/bash gtester && \
    /usr/sbin/locale-gen en_US.UTF-8

# Add the user gtester
#RUN useradd --create-home --shell /bin/bash gtester && \
#    usermod -aG sudo gtester && \
#    /usr/sbin/locale-gen en_US.UTF-8

# New added for disable sudo password
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set as default user
USER gtester
WORKDIR /home/gtester

ENV LANG=en_US.UTF-8
