# Use the official Node.js image as the base image
FROM node

# Install pnpm globally (if you prefer to use npm, it's already included in Node.js image)
RUN npm install -g pnpm

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app (replace 'npm run build' with your build command if needed)
RUN npm run build

# Expose the port where the React app will run (usually 3000)
EXPOSE 3000
#
# Command to run the React app
CMD ["npm", "start"]
