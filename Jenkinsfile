pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo "Building the Ruby app..."
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nupmanyu/ruby-sample-app .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: '19228d92-1e9c-4cce-87a2-bbbe76f06b9b',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push nupmanyu/ruby-sample-app
                    '''
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                    # Pull the latest image from Docker Hub
                    docker-compose pull

                    # Start the new container using the updated image
                    docker-compose up -d --build
                '''
            }
        }
    }
}
