FROM python:3.9-slim-buster

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    openssh-client \
    ansible \
 && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy Ansible playbook to container
COPY playbook.yml /app/playbook.yml

# Copy script to add post to WordPress
COPY add_post.py /app/add_post.py

# Install dependencies
RUN pip install requests

# Run Ansible playbook to set up WordPress site and schedule task to add post every hour
CMD ansible-playbook playbook.yml && while true; do python add_post.py; sleep 3600; done
