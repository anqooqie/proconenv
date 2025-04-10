FROM ubuntu:22.04

# Information about the user
ARG USERNAME=anqooqie
ARG USER_EMAIL=zzzfuku1991@gmail.com
ARG USER_UID=1000
ARG USER_GID=1000

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and set up the environment
RUN apt-get update \
    \
    # Make the Japanese locale available
    && apt-get install -y --no-install-recommends \
    locales \
    && locale-gen ja_JP.UTF-8 \
    \
    # Make the Japanese time zone available
    && apt-get install -y --no-install-recommends \
    tzdata \
    \
    # Make GCC 12 the default compiler
    && apt-get install -y --no-install-recommends \
    gnupg-agent \
    software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    gcc-12 \
    g++-12 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 60 \
                           --slave   /usr/bin/g++ g++ /usr/bin/g++-12 \
    \
    # Install utility commands
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    cmake \
    curl \
    gdb \
    git \
    less \
    openssh-client \
    sudo \
    time \
    vim \
    \
    # Install online-judge-tools, competitive-verifier and aclogin
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    && pip3 install \
    aclogin \
    competitive-verifier \
    online-judge-tools \
    online-judge-verify-helper \
    \
    # Install atcoder-cli
    && apt-get install -y --no-install-recommends \
    nodejs \
    npm \
    && npm install -g \
    atcoder-cli \
    \
    # Install Ruby and Bundler to see the documents generated by competitive-verifier
    && apt-get install -y --no-install-recommends \
    libreadline-dev \
    libssl-dev \
    ruby-all-dev \
    ruby-bundler \
    zlib1g-dev \
    \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    # Create a new user with sudo privileges
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Python 3.11, the version available on the AtCoder online judge.
RUN cd /tmp \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    lcov \
    pkg-config \
    libbz2-dev \
    libffi-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    lzma \
    lzma-dev \
    tk-dev \
    uuid-dev \
    zlib1g-dev \
    git \
    && curl -o Python-3.11.4.tar.xz https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tar.xz \
    && tar xf Python-3.11.4.tar.xz \
    && cd Python-3.11.4 \
    && ./configure --enable-optimizations \
    && make \
    && make altinstall \
    && cd .. \
    && python3.11 -m pip install \
    numpy==1.24.1 \
    scipy==1.10.1 \
    networkx==3.0 \
    sympy==1.11.1 \
    sortedcontainers==2.4.0  \
    more-itertools==9.0.0 \
    shapely==2.0.0 \
    bitarray==2.6.2 \
    PuLP==2.7.0 \
    mpmath==1.2.1 \
    pandas==1.5.2 \
    z3-solver==4.12.1.0 \
    scikit-learn==1.2.0 \
    ortools==9.5.2237 \
    torch==1.13.1 \
    polars==0.15.15 \
    lightgbm==3.3.1 \
    gmpy2==2.1.5 \
    numba==0.57.0 \
    git+https://github.com/not522/ac-library-python \
    && python3.11 -m pip install -U setuptools==66.0.0 \
    && python3.11 -m pip install cppyy==2.4.1 \
    && rm -rf Python-3.11.4.tar.gz Python-3.11.4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch to the new user and set up the home directory
USER $USERNAME
WORKDIR /home/$USERNAME

# Configure settings to be stored in the home directory
RUN acc config oj-path "$(realpath "$(which oj)")" \
    && acc config default-test-dirname-format test \
    && acc config default-template cpp \
    && git config --global core.editor vim \
    && git config --global init.defaultBranch main \
    && git config --global user.name $USERNAME \
    && git config --global user.email $USER_EMAIL
