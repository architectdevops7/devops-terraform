pipeline {
    agent any
  environment {
    dockerhub=credentials('docker-hub-password')
 stages {
  stage('Clone repository') {
            steps {
                git 'https://github.com/architectdevops7/docker.git'
            }
        }
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t httpwebapp:latest .' 
                  sh 'docker tag httpwebapp architectdevops7/httpwebapp:latest'
          }
        }
   stage('Docker push image'){
          steps {
              sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
              sh 'docker push httpwebapp architectdevops7/httpwebapp:latest'
          }
        }
   stage('Run docker container') {
     steps {
       sh "docker run -d -p 80:80 architectdevops7/httpwebapp"
        }
      }
    }
  }
}
   
