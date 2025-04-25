# Use an official lightweight Python image
FROM python:3.11-slim

# Metadata
LABEL maintainer="francesco.corbosiero@alpacode.studio"

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    sshpass \
    curl \
    sudo \
    openssh-client \
    && pip install --upgrade pip \
    && pip install ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /ansible

COPY ssh-keys/ansible /root/.ssh/ansible
RUN chmod 600 /root/.ssh/ansible && chown root:root /root/.ssh/ansible


# Optional: disable strict host key checking for SSH
RUN echo "Host *\n    StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

# Default command
CMD ["/bin/bash"]
