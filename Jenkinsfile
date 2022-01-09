pipeline {
	agent { label 'mvn' }
    stages {
	    
       stage('pull') {
            steps {
                sh 'sudo rm -rf hello-world-war'
	sh 'git clone https://github.com/ruhanrs/hello-world-war.git'	
              }
        }
	 stage('tom-instal') {
	
            steps {
                dir('hello-world-war'){
                sh 'docker build -t tomcat:ver1.1 .'  
                }
              
             }
	 }
	 stage('deploy'){
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 7777:8080 tomcat:ver1.1'
	     }
	 }
    }
}
