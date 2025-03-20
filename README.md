# Jenkins Docker Setup

This project provides a Docker setup for Jenkins, allowing you to easily build and run Jenkins in a containerized environment.

## Project Structure

- **Dockerfile**: Contains the instructions to build a Docker image for Jenkins.
- **jenkins_home**: Directory to store Jenkins configuration and job data. This should be mounted as a volume to persist data.
- **plugins.txt**: Lists the Jenkins plugins to be installed in the Docker image.

## Getting Started

To build and run the Jenkins Docker container, follow these steps:

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd jenkins-docker-setup
   ```

2. **Build the Docker image**:
   ```
   docker build -t jenkins-docker-setup .
   ```

3. **Run the Docker container**:
   ```
   docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins-docker-setup
   ```

4. **Access Jenkins**:
   Open your web browser and go to `http://localhost:8080`. Follow the on-screen instructions to complete the setup.

## Configuration

You can customize the Jenkins setup by modifying the `plugins.txt` file to include any additional plugins you need.

## License

This project is licensed under the MIT License.