pipeline {
	agent { label 'java' }
    stages {
	    stage('checkout') {
            steps {	
		
                sh 'git clone https://github.com/lohitesh/hello-world-war/'
            }
        }
       stage('build') {
            steps {	
	sh 'mvn clean package'	
              }
        }
	 stage('copy') {
            steps {	
	sh 'cp /home/slave-5/jenkins/workspace/hello1/target/hello-world-war-1.0.0.war /opt/apache-tomcat-9.0.56/webapps/'	
              }
        }    
    }
}
