# Dockerfile
FROM ghcr.io/cirruslabs/flutter:stable

# Install Node.js (needed for Claude Code)
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Install Claude Code globally
RUN npm install -g @anthropic-ai/claude-code

WORKDIR /app

CMD ["bash"]