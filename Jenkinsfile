pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REGISTRY = '548341944327.dkr.ecr.us-east-1.amazonaws.com'
        ECR_REPOSITORY = 'jenkins_flask_image_repo'
        IMAGE_TAG = '3.0'
    }
    stages {
        stage('Login to ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}"
                }
            }
        }
        stage('Build and push image to ECR') {
            steps {
                script {
                    def imageName = "${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}"
                    docker.build(imageName).push()
                }
            }
        }
    }
}
