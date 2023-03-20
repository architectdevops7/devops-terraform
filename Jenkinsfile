pipeline {
    agent any
 stages {
  stage('Clone repository') {
            steps {
                git 'https://github.com/architectdevops7/docker.git'
            }
        }
  stage('Docker Build') {
           steps {
              
                sh 'docker build -t httpwebapp:latest .' 
          }
        }
   stage('Docker push image'){
          steps {
              withCredentials([usernamePassword(credentialsId: 'docker-repo-creds', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        	    sh 'docker tag httpwebapp architectdevops7/httpwebapp:latest'
                sh 'docker push architectdevops7/httpwebapp:latest'
          }
        }
   stage('Run docker container') {
     steps {
       sh "docker run -d -p 3000:80 architectdevops7/httpwebapp"
        }
      }
    }
}
   
