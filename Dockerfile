# Step 1: Using Node.js official image as base
FROM node:20

# Step 2: Set working directory inside the container
WORKDIR /src/app

# Step 3: Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the project files into the container
COPY . .

# Step 6: Expose port 3000 to access the app
EXPOSE 3000

# Step 7: Command to start the app
CMD ["node", "server.js"]
