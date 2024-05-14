# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY ./BackEND/package*.json ./

# Install dependencies
RUN npm install --production

# Copy the backend code to the container
COPY ./BackEND .

# Your app binds to port 5000, so expose it
EXPOSE 5000

# Define the command to run your app
CMD [ "node", "index.js" ]
