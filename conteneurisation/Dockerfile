FROM ubuntu:latest

ARG USER_NAME=harouna
ARG USER_GROUP=harouna

RUN apt update && apt install  openssh-server sudo -y
# Create a user  and group 
RUN groupadd $USER_GROUP && useradd -ms /bin/bash -g $USER_GROUP $USER_NAME
# Create user directory in home
RUN mkdir -p /home/$USER_NAME/.ssh
# Copy the ssh public key in the authorized_keys file. The idkey.pub below is a public key file you get from ssh-keygen. They are under ~/.ssh directory by default.
COPY key.pub /home/$USER_NAME/.ssh/authorized_keys
# change ownership of the key file. 
RUN chown $USER_NAME:$USER_GROUP /home/$USER_NAME/.ssh/authorized_keys && chmod 600 /home/$USER_NAME/.ssh/authorized_keys
# remove the user password 
RUN sudo passwd -d $USER_NAME
# give priviledge to user 
RUN usermod -aG sudo $USER_NAME
#install python3 utilities
# RUN echo "1" | sudo apt install -y build-essential checkinstall \ 
#     libncursesw5-dev libssl-dev \
#     libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev 
# # install common-repos
# RUN sudo apt-get install software-properties-common -y
# #apt update 
# RUN sudo apt-get update -y 
# # install apt repository  
# # RUN sudo add-apt-repository ppa:deadsnakes/ppa -y 
# # #install python3
# RUN sudo apt install python3 -y
# Start SSH service
RUN service ssh start
# Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
