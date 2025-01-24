FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    locales \
    && locale-gen ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    build-essential \
    gdb \
    cmake \
    git \
    sudo \
    curl \
    time \
    less \
    openssh-client \
    python3 \
    python3-pip \
    nodejs \
    npm \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    ruby-all-dev \
    ruby-bundler \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install online-judge-tools \
    online-judge-verify-helper \
    competitive-verifier

RUN npm install -g atcoder-cli

ARG USERNAME=anqooqie
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN acc config oj-path "$(realpath "$(which oj)")" \
    && acc config default-test-dirname-format tests \
    && acc config default-template cpp \
    && git config --global user.name $USERNAME \
    && git config --global user.email 'zzzfuku1991@gmail.com' \
    && git config --global core.editor vim
