# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install Google Cloud SDK
RUN apt-get update && apt-get install -y curl
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

# Install Google Cloud SDK and build essentials
RUN apt-get update && apt-get install -y build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Install gsutil
RUN /bin/bash -c "source /root/google-cloud-sdk/path.bash.inc && gcloud components install gsutil"

# Create model directory and Download LongT5 model
RUN mkdir -p /app/model && gsutil -m cp -r gs://t5-data/pretrained_models/t5x/longt5/local_base/checkpoint_1000000 /app/model/

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]

