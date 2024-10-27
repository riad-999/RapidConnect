# Starting from Node 14 Alpine base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock, then install dependencies
COPY package.json .
COPY yarn.lock .
RUN yarn install --production

# Copy the rest of the application files
COPY . .

# Expose the port (optional)
EXPOSE 3000

# Start the server
CMD ["node", "index.js"]
