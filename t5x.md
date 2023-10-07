# T5X Brainwave Model Training with Docker

## Overview

This repository contains a Dockerfile for setting up an environment to train a LongT5 model on brainwave data stored in JSON files. The LongT5 model architecture was chosen for its effectiveness in handling long sequences, which is crucial for brainwave data.

## Motivation

- **Containerization**: Using Docker ensures that the environment is consistent, making it easier to share and deploy.
- **Model Choice**: LongT5 is chosen for its ability to handle long sequences, suitable for brainwave data.
- **T5X**: Provides a flexible and extensible framework for training and evaluating T5 models.

## Installation

### Using Docker

1. Clone this repository.
2. Navigate to the directory containing the Dockerfile.
3. Build the Docker image:  
   ```
   docker build -t malnati/t5x-brainwaves .
   ```
4. Run the Docker container:  
   ```
   docker run -it malnati/t5x-brainwaves
   ```

### Local Installation

1. Clone this repository.
2. Install the required Python packages:  
   ```
   pip install -r requirements.txt
   ```
3. Follow the T5X guidelines to set up your training environment.

## Steps to Follow

### Step 1: Choose a Model Architecture

We have already decided on using LongT5 for this project.

### Step 2: Choose a SeqIO Task/Mixture

The next step is to obtain the first set of brainwave JSON files. A custom SeqIO task will be created to read these files.

### Step 3: Write a Gin Config

Create a Gin configuration file to specify all the hyperparameters for the training job.

### Step 4: Launch Your Experiment

Use the T5X training script to start the training job.

### Step 5: Monitor Your Experiment and Parse Metrics

Monitor the training metrics to ensure effective learning.

## Note

This project is still in progress. The next immediate step is to obtain the first set of brainwave JSON files.

## References

- [T5X Documentation](https://t5x.readthedocs.io/en/latest/usage/index.html)
