pipeline {
    agent any

    stages {
        stage("Build Docker Image") {
            steps {
                sh 'docker build -t myapp .'
            }
        }
        stage("Run Container") {
            steps {
                sh 'docker run -p 5000:5000 myapp'
            }
        }
        stage("Test Container") {
            steps {
                sh 'docker ps | grep myapp'
            }
        }
    }
}
