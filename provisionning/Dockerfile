FROM marwaney/ssh-server
ARG ssh_public=id_rsa.pub
COPY ${ssh_public} /home/sshuser/.ssh/authorized_keys
EXPOSE 22