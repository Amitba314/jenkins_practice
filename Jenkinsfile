pipeline {
	agent any
  stages 
  {
    stage('Docker Build') 
    {
    	agent any
      steps {
        sh 'echo "Building Docker Image..."'
      	sh 'docker build -t app_image:1.0 .'
        sh 'docker images'
      }
    }
    stage('Push Image to ECR') 
    {
    	agent any
      steps {
        sh 'echo "Pushing Image to ECR..."'
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 548341944327.dkr.ecr.us-east-1.amazonaws.com'
	sh 'docker tag app_image:1.0 548341944327.dkr.ecr.us-east-1.amazonaws.com/jenkins_flask_image_repo:1.0'
	sh 'docker push 548341944327.dkr.ecr.us-east-1.amazonaws.com/jenkins_flask_image_repo:1.0'
      }
    }
    stage('SSH to App Server') 
    {
    	agent any
      steps {
        sh 'echo "Connecting to APP server..."'
	sh 'sudo chmod 600 ~/.ssh/kirito_jenkins.pem'
      	sh 'ssh -i ~/.ssh/kirito_jenkins.pem ubuntu@44.211.183.23'
	sh 'echo "shalom"'
      }
    }
  }
}
