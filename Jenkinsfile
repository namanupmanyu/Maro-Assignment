pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/namanupmanyu/Maro-Assignment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ruby-sample-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 4000:4000 ruby-sample-app'
            }
        }
    }
}
