# Base image with 150MB
FROM python:3.10-slim


# Install system deps
RUN apt-get update && apt-get install -y curl gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# 3. Copy dependency file first (for caching efficiency)
COPY package*.json .

# 4. Install dependencies
RUN npm install

# 5. Copy the rest of the application code
COPY . .

# 6. Expose a port (optional, for web apps)
EXPOSE 3001


# 8. Default command to run when container starts
CMD ["npm","start"]
