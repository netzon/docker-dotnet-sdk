FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y \
        nodejs \
    && npm install -g pnpm \
    && rm -rf /var/lib/apt/lists/*