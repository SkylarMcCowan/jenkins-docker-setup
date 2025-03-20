FROM fedora:41

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Configure SSH server to allow key-based authentication and disable password authentication
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config

RUN ssh-keygen -A

CMD /usr/sbin/sshd -D