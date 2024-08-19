FROM --platform=linux/amd64 ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    unzip \
    openjdk-11-jdk \
    autoconf \
    libtool \
    pkg-config \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libtinfo5 \
    cmake \
    libffi-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Buildozer dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    ccache \
    libncurses5 \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Cython and Buildozer
RUN pip3 install --upgrade pip
RUN pip3 install cython buildozer

WORKDIR /app

COPY . /app/

RUN pip3 install -r requirements.txt

CMD ["/bin/bash"]
