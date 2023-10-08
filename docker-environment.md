# Docker Development Environment Setup

## Introduction

This guide aims to help you set up a Docker development environment for your NodeJS application. By following these steps, you'll be able to develop your application within a Docker container, avoiding the need to install dependencies on your local machine.

## Prerequisites

- Docker Desktop installed on your MacBook Air M2
- Visual Studio Code installed
- Git installed

## Step 1: Initialize Docker Dev Environment


1. **Open your terminal and navigate to your project directory.**

    ```bash
    cd path/to/your/project
    ```

2. **Create a Dockerfile for your development environment.**

    ```bash
    touch Dockerfile-DevEnvironment
    ```

    Open the Dockerfile-DevEnvironment in a text editor and add the following content:

    ```Dockerfile
    # Use an official Node runtime as base image
    FROM node:14

    # Set the working directory in the container
    WORKDIR /usr/src/app

    # Install app dependencies
    COPY package*.json ./
    RUN npm install

    # Copy the current directory contents into the container
    COPY . .
    ```

3. **Create a `docker-compose.yaml` file.**

    ```bash
    touch docker-compose.yaml
    ```

    Open the `docker-compose.yaml` in a text editor and add the following content:

    ```yaml
    version: "3.7"
    services:
      app:
        build:
          context: .
          dockerfile: Dockerfile-DevEnvironment
        ports:
          - "3000:3000"
    ```

4. **Create a `package.json` file.**

    ```bash
    touch package.json
    ```

    Open the `package.json` in a text editor and add the following content:

    ```json
    {
      "name": "your-app-name",
      "version": "1.0.0",
      "main": "index.js",
      "scripts": {
        "start": "node index.js"
      }
    }
    ```

5. **Create an `index.js` file.**

    ```bash
    touch index.js
    ```

    Open the `index.js` in a text editor and add the following content:

    ```javascript
    console.log("Hello, world!");
    ```

6. **Build and Run the Docker Container.**

    ```bash
    docker-compose up --build
    ```

    If everything is set up correctly, you should see the output "Hello, world!" in your terminal.
   
1. Open your terminal and navigate to your project directory.
2. Run the following command to initialize a new Docker Dev Environment:

    ```bash
    docker dev env create
    ```

> **Note**: This will create a `compose-dev.yaml` file in your project directory.

## Step 2: Launch VSCode

1. Open VSCode.
2. Use the Docker extension to connect to your Docker Dev Environment.

## Step 3: Configure Dependencies

1. Open the `compose-dev.yaml` file.
2. Add the necessary configurations to set up your NodeJS environment.

    ```yaml
    version: "3.7"
    services:
      app:
        build: .
        ports:
          - "3000:3000"
    ```

> **Note**: This assumes that your Dockerfile is in the root of your project directory.

## Step 4: Build and Run

1. In your terminal, run:

    ```bash
    docker compose up
    ```

This will build and run your NodeJS app inside the Docker container.

## Step 5: Share Your Dev Environment

1. Push your code and `compose-dev.yaml` file to your GitHub repository.
2. Create a shareable link as follows:

    ```
    https://open.docker.com/dashboard/dev-envs?url=https://github.com/Malnati/brain-text
    ```
