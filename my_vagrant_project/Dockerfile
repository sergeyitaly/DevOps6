# Use the official Ubuntu image as a parent image
FROM ubuntu:bionic

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server sudo

# Create the necessary directory
RUN mkdir /var/run/sshd

# Set the root password
RUN echo 'root:1234' | chpasswd

# Allow root login and password authentication
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
