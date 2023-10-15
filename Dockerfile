# Use Node 16 as the base image
FROM node:16

# Set a working directory within the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application code to the container
COPY . .

# Build the Angular application
RUN npm run build

# Expose the port your Angular app will run on (default is 80)
EXPOSE 80

# Define the command to start your Angular app
CMD ["node_modules/.bin/ng","serve","--host", "0.0.0.0"]
