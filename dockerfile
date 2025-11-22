# Use stable Node.js LTS
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy only package files first (better Docker caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the app
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
