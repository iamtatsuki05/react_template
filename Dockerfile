FROM ubuntu:22.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    vim neovim \
    git git-lfs \
    zip unzip \
    curl wget gnupg file tree \
    sudo && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g typescript react react-dom create-react-app

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN npm install
