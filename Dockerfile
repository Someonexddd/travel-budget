# Use the official Node.js image as the base image
FROM node

# Install pnpm globally
RUN npm install -g pnpm

# Set the working directory inside the container
WORKDIR /app

# Copy package.json, pnpm-lock.yaml, and the rest of the application code
COPY package.json pnpm-lock.yaml ./
COPY public ./public
COPY src ./src
COPY tsconfig.json ./

# Install dependencies using pnpm
RUN pnpm install --frozen-lockfile

# Build the Next.js app
RUN pnpm build

# Expose the port Next.js is running on (usually 3000)
EXPOSE 3000
#
# Start the Next.js app
CMD ["pnpm", "start"]
