FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    g++ \
    git \
    cmake \
    ruby-full \
    libglvnd-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libasound2-dev \
    make \
    && rm -rf /var/lib/apt/lists/*
