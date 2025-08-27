# Base image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy dependency file first (for caching efficiency)
COPY package*.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose a port (optional, for web apps)
EXPOSE 3000


# Default command to run when container starts
CMD ["npm","start"]
