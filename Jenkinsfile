pipeline {
	agent any
  stages 
  {
    stage('Docker Build') 
    {
    	agent any
      steps {
        sh 'echo "Building Docker Image..."'
      	sh 'docker build -t app_image:2.0 .'
        sh 'docker images'
      }
    }
    stage('Push Image to ECR') 
    {
    	agent any
      steps {
        sh 'echo "Pushing Image to ECR..."'
        sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 548341944327.dkr.ecr.us-east-1.amazonaws.com'
	sh 'docker tag app_image:2.0 548341944327.dkr.ecr.us-east-1.amazonaws.com/jenkins_flask_image_repo:latest'
	sh 'docker push 548341944327.dkr.ecr.us-east-1.amazonaws.com/jenkins_flask_image_repo:latest'
      }
    }
   
  }
}
