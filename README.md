Here's an example of how to structure your `README.md` for the To-Do app with Docker. It will cover setting up the project, running it with Docker, and explain the functionality.

---

# To-Do App with Docker

This is a simple To-Do application built with Node.js and Express, which is containerized using Docker. The app allows you to add, remove, and view your tasks. It serves static HTML, CSS, and JavaScript files.

## Features

- Add, remove, and display tasks.
- Serve static files (HTML, CSS, JS) using Express.
- Containerized with Docker and managed with Docker Compose.

---

## Table of Contents

1. [Installation](#installation)
2. [Run the Application](#run-the-application)
3. [App Structure](#app-structure)
4. [Docker Setup](#docker-setup)
5. [License](#license)

---

## Installation

### Prerequisites

Ensure that you have the following installed:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)

Clone the repository and navigate to the project directory:

```bash
git clone <your-repository-url>
cd <your-project-directory>
```

---

## Run the Application

### With Docker Compose

To build and run the app using Docker Compose, run the following commands in your terminal:

1. **Build the Docker image and start the containers:**

   ```bash
   docker-compose up --build
   ```

   This will:

   - Build the Docker image from the `Dockerfile`.
   - Start the container as defined in `docker-compose.yml`.

2. **Access the App:**

   Once the app is running, open your browser and go to [http://localhost:3000](http://localhost:3000) to see the To-Do app in action.

3. **Run in Detached Mode (optional):**

   To run the app in the background, use the `-d` flag:

   ```bash
   docker-compose up -d
   ```

4. **Stop the Application:**

   To stop the app and remove containers, run:

   ```bash
   docker-compose down
   ```

- **`server.js`**: This file contains the Express server setup and serves static files such as HTML, CSS, and JavaScript.
- **`public/`**: This folder contains all the static files for the app (HTML, CSS, JS).
- **`Dockerfile`**: This file defines the instructions for building the Docker image for the app.
- **`docker-compose.yml`**: This file defines the configuration for Docker Compose, which is used to build and run the app in a container.

---

## Docker Setup

The app is containerized using Docker. Here's a breakdown of the configuration:

### Docker Compose (`docker-compose.yml`)

```yaml
version: "3.8"

services:
  app:
    build: .
    container_name: nodejs-app
    ports:
      - "3000:3000" # Maps the container's port 3000 to local machine's port 3000
    volumes:
      - .:/src/app # Mounts the current directory to the container
```

- **`build: .`**: This tells Docker Compose to build the Docker image from the current directory (where the `Dockerfile` is).
- **`container_name: nodejs-app`**: The container will be named `nodejs-app`.
- **`ports: - "3000:3000"`**: Maps the container's port 3000 to your local machine's port 3000.
- **`volumes: - .:/src/app`**: Mounts the current directory (`.`) to the container's `/src/app` directory, allowing you to make changes locally and see them reflected in the container without rebuilding.

- **`FROM node:20`**: Uses the official Node.js image (version 20) as the base for the container.
- **`WORKDIR /src/app`**: Sets the working directory to `/src/app` inside the container.
- **`COPY package*.json ./`**: Copies `package.json` and `package-lock.json` into the container.
- **`RUN npm install`**: Installs the dependencies inside the container.
- **`COPY . .`**: Copies all the project files into the container.
- **`EXPOSE 3000`**: Exposes port 3000 to allow access to the app.
- **`CMD ["node", "server.js"]`**: Runs the app with `node server.js` to start the Express server.

---
