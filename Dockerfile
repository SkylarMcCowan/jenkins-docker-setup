FROM jenkins/jenkins:lts

USER root

# Install any necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Add the SSH key and set correct permissions
COPY remote-key /tmp/remote-key
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    mkdir -p /var/jenkins_home/.ssh && \
    touch /var/jenkins_home/.ssh/known_hosts

USER jenkins

# Expose the Jenkins port
EXPOSE 8080

# Set the entrypoint and default command to run Jenkins
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["sh", "-c", "ssh-keygen -f \"/var/jenkins_home/.ssh/known_hosts\" -R \"remote_host\" || true && ssh-keyscan -H remote_host >> /var/jenkins_home/.ssh/known_hosts && java -jar /usr/share/jenkins/jenkins.war"]