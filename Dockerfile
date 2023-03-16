FROM mcr.microsoft.com/dotnet/sdk:7.0

# Install Node.js
RUN apt-get -y update  \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && npm install -g pnpm \
    && rm -rf /var/lib/apt/lists/*