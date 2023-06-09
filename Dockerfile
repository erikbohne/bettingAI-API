# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Add keys directory
COPY keys/postgreSQLKey.json keys/postgreSQLKey.json

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y gcc
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run main.py when the container launches
CMD ["python", "main.py"]

