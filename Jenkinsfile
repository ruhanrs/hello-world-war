pipeline {
	agent none
environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_mvn')
	}
    stages {
	
       stage('checkout') {
    agent  { label 'mvn' }
            steps {
                sh 'sudo rm -rf hello-world-war'
	sh 'git clone https://github.com/ruhanrs/hello-world-war.git'	
              }
        }
	 stage('build') {
 agent  { label 'mvn' }
	steps {
 
                dir('hello-world-war'){
                  sh 'pwd'
                sh 'ls'
            
                sh 'docker build -t tomcat:1.0 .'  
                }
            }
	 }
	 stage('deploy'){
 agent  { label 'mvn' }
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 8888:8080 tomcat:1.0'
	     }
	 }
		stage('Login') {
agent  { label 'mvn' }
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
	stage('Push') {
 agent  { label 'mvn' }

			steps {
			    sh 'docker tag tomcat:1.0 ruhanrs/myrepo:1.4'
				sh 'docker push ruhanrs/myrepo:1.4'
			}
		}

    stage('pull image'){
    agent { label 'mvn2' }
        steps{
            sh 'docker rm -f mytomcat'
            sh 'docker run -d --name mytomcat -p 7100:8080 ruhanrs/myrepo:1.4'
        }
    }
    }
}
            
            
