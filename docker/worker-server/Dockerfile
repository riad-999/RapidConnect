# Start from the Node 14 Alpine base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package and lock files to install dependencies
COPY package.json .
COPY yarn.lock .

# Install dependencies
RUN yarn install --production

# Copy the rest of the application files
COPY . .

# Expose the port the app will run on (e.g., 3000)
EXPOSE 3000

# Start the server
CMD ["node", "index.js"]
