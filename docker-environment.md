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

---

## Step 2: Launch VSCode Dev Environment

1. **Open Docker Desktop.**

    Navigate to the Dev Environments tab.

2. **Create a New Dev Environment.**

    Click on the "New Environment" button and select your project directory where the `docker-compose.yaml` and `Dockerfile-DevEnvironment` are located.

3. **Launch VSCode.**

    Once the environment is created, click on the "Open in VSCode" button. This will launch Visual Studio Code with the remote container extension, connecting it to your Docker container.

---

## Step 3: Install Dependencies Inside Docker Container

1. **Open Terminal in VSCode.**

    Once VSCode is connected to your Docker container, open a new terminal window inside VSCode. This terminal will be running inside your Docker container.

2. **Install Dependencies.**

    Run the following command to install the dependencies specified in your `package.json`:

    ```bash
    npm install
    ```

### Step 3.1: Install Dependencies Inside Docker Container (Example Output)

After running the `npm install` command in the terminal within VSCode, you may see the following output:

```bash
root@01b443cf3002:/com.docker.devenvironments.code# npm install
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN brain-text@1.0.0 No repository field.
npm WARN brain-text@1.0.0 No license field.

up to date in 0.349s
found 0 vulnerabilities

root@01b443cf3002:/com.docker.devenvironments.code#
```

### Notes:

- **Lockfile Created**: A `package-lock.json` file is created. It's advisable to commit this file to your repository.
- **Warnings**: You may see warnings about missing repository and license fields in your `package.json`. These are optional but recommended for a complete package configuration.

The page for your Docker Hub repository "malnati/t5x-brainwaves" provides an overview of the Dockerized environment you've set up for running and training the LongT5 model on brainwave data. The LongT5 model is part of the T5X library, designed for various natural language processing tasks. Your specific implementation aims to train the model on JSON-formatted brainwave data along with associated text content. The page also includes a Docker Pull Command for users to pull the image.

### Advantages of Uploading to Docker Hub
1. **Version Control**: You can tag different versions of your Docker image, making it easier to roll back to previous versions if needed.
2. **Accessibility**: Others can easily pull your Docker image and run containers based on it, facilitating collaboration.
3. **Automated Builds**: Docker Hub can automatically build your Docker image whenever you push changes to a linked GitHub repository.

### Markdown Content for docker-environment.md
```markdown
## Step 3.2: Publish Docker Image to Docker Hub (Optional)

### Advantages
- Version control for your Docker images.
- Easy accessibility for collaboration.
- Automated builds linked to your GitHub repository.

### Procedure
1. Log in to your Docker Hub account.
   ```
   docker login
   ```
2. Tag your Docker image.
   ```
   docker tag local-image-name:tagname new-repo-name:tagname
   ```
3. Push the Docker image to your Docker Hub repository.
   ```
   docker push new-repo-name:tagname
   ```
Example output after pushing the image:
```
The push refers to repository [docker.io/new-repo-name/tagname]
...
```
```

---
## Step 4: Build Neurosity NodeJS App

1. **Follow the Neurosity Tutorial.**

    At this point, you can proceed to follow the steps in the Neurosity tutorial to build your NodeJS app. Since you are working within a Docker container, all dependencies and files will be isolated from your local environment.

---

## Step 5: Share Dev Environment

1. **Generate Shareable Link.**

    Go back to Docker Desktop and navigate to the Dev Environments tab. Select your environment and click on the "Share" button. This will generate a shareable link similar to `https://open.docker.com/dashboard/dev-envs?url=https://`.

2. **Update GitHub Repository.**

    Add this shareable link to your GitHub repository, specifically in the README or "docker-environment.md", to allow others to easily access and set up the same development environment.