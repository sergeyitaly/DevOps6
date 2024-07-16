FROM ubuntu:bionic

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Create SSH directory
RUN mkdir /var/run/sshd

# Set root password
RUN echo 'root:1234' | chpasswd

# Allow root login
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Allow password authentication
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

