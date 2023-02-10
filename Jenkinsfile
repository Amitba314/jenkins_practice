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
                 sh 'docker run -d -p 5000:5000 myapp'
             }
         }
         stage("Login to AWS ECR") {
             steps {
                 withCredentials([aws(credentialsId: 'AWS_Cradentials', region: 'us-east-1')]) {
                     sh 'eval $(aws ecr get-login --region us-east-1 --no-include-email)'
                 }
             }
         }
         stage("Push Docker Image to ECR") {
             steps {
                 sh 'docker tag myapp:latest 548341944327.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
                 sh 'docker push 548341944327.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
             }
         }
     }
 }
 
