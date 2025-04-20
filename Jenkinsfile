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
                sh 'docker-compose build'
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
                        docker-compose push
                    '''
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                    docker-compose down || true
                    docker-compose pull
                    docker-compose up -d
                '''
            }
        }
    }
}
