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
        volumes:
            - ~/.ssh/id_rsa:/root/.ssh/id_rsa:ro
    ```

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

### Example Output After Installing Dependencies

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

---

## Step 4: Publish Docker Image to Docker Hub (Optional)

### Advantages

- Version control for your Docker images.
- Easy accessibility for collaboration.
- Automated builds linked to your GitHub repository.

### Procedure

1. Log in to your Docker Hub account.
    ```bash
    docker login
    ```

2. Tag your Docker image.
    ```bash
    docker tag local-image-name:tagname new-repo-name:tagname
    ```

3. Push the Docker image to your Docker Hub repository.
    ```bash
    docker push new-repo-name:tagname
    ```

Example output after pushing the image:

```bash
The push refers to repository [docker.io/new-repo-name/tagname]
...
```

---

## Step 5: Build Neurosity NodeJS App

1. **Follow the Neurosity Tutorial.**
    At this point, you can proceed to follow the steps in the Neurosity tutorial to build your NodeJS app. Since you are working within a Docker container, all dependencies and files will be isolated from your local environment.

---

## Step 6: Share Dev Environment

1. **Generate Shareable Link.**
    If the "Share" button is not available in Docker Desktop, you can create a manual link:
    ```bash
    https://open.docker.com/dashboard/dev-envs?url=https://github.com/Malnati/brain-text
    ```

2. **Update GitHub Repository.**
    Add this shareable link to your GitHub repository, specifically in the `docker-environment.md`, to allow others to easily access and set up the same development environment.


---

# Security Considerations for GitHub and Docker Hub

> **Note**: Before proceeding to the Neurosity tutorial, it's crucial to familiarize yourself with best practices for securing your Docker Hub and GitHub repositories, especially when working in a team environment. This includes understanding how to handle credentials and private information securely. Mismanagement of sensitive data can expose your project to vulnerabilities. Learning about secure ways to manage credentials and private information in your repositories should be your next step.

## Git Credentials in Docker Development Container

To securely handle Git credentials in your Docker development container, you can use SSH keys or token-based authentication. If you're using SSH keys, you can mount them as shown above. For token-based authentication, you can use environment variables or Docker secrets.

### Advantages of Mounting SSH Key

1. Security: SSH keys are more secure than passwords.
1. Ease of Use: Once set up, you don't have to enter credentials for each Git operation.
1. MFA Bypass: If you have Multi-Factor Authentication (MFA) enabled for GitHub, SSH keys allow you to bypass MFA during Git operations.

### Using SSH Keys

**Mount Your SSH Key as a Volume**

You can mount your SSH key into the Docker container to avoid copying it, which could expose it to risks.

```yaml
services:
    app:
    volumes:
        - ~/.ssh:/root/.ssh:ro
```

This will mount your SSH key as read-only inside the container.

### Important Reminders

- Always use HTTPS or SSH URLs for Git repositories to ensure encryption.
- Regularly rotate your credentials and SSH keys.
- If you're using public repositories, make sure not to push any code that contains sensitive information.

