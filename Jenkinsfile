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
                sh 'docker build -t ruby-sample-app .'
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh 'docker tag ruby-sample-app nupmanyu002/ruby-sample-app'
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
                        docker push nupmanyu002/ruby-sample-app
                    '''
                }
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 4000:4000 nupmanyu002/ruby-sample-app'
            }
        }
    }
}

