# Use the latest Node.js (v25) on Alpine Linux
FROM node:25-alpine

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy dependency files first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose Vite dev server port
EXPOSE 5173

# Default command: run Vite dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]