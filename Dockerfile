FROM ubuntu:22.04 AS build

RUN apt-get update \
    && apt-get install -y \
        locales \
        curl \
        wget \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update -y \
    && apt-get install -y \
        nodejs \
        dotnet-sdk-6.0 \
        dotnet-sdk-7.0 \
    && npm install -g pnpm \
    && rm -rf /var/lib/apt/lists/*
ENV LANG en_US.utf8