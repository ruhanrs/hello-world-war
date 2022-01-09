pipeline {
	agent none
	stages {
	    
       stage('checkout') {
	       agent { label 'mvn' }
            steps {
                sh 'sudo rm -rf hello-world-war'
	sh 'git clone https://github.com/ruhanrs/hello-world-war.git'	
              }
        }
	 stage('build') {
		 agent { label 'mvn' }
	
            steps {
                dir('hello-world-war'){
                  sh 'pwd'
                sh 'ls'
            
                sh 'docker build -t tomcat:ver1.1 .'  
			
                }
	    }
	 }
                stage('push') {
			agent { label 'mvn' }
	
            steps {
		    sh 'ls'
            sh 'docker tag tomcat:ver1.1 ruhanrs/myubuntu:1.0'
		    sh 'docker images'
                sh 'docker push ruhanrs/myubuntu:1.0'
         }
	 }
		 stage('deploy'){
		 agent { label 'mvn2' }
	     steps{
	        sh 'docker rm -f mytomcat'
	         sh 'docker run -d --name mytomcat -p 7777:8080 ruhanrs/myubuntu:1.0'
	     }
	 }
	
    }
}
