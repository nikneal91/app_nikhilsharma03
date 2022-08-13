pipeline {
    agent any
tools { 
      maven 'MAVEN3'
      jdk 'jdk8'
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
               
            }
        }
        stage('Java setup') {
            steps {
            sh 'java -version'
            }
        }
        stage('Maven setup') {
            steps {
            sh 'mvn clean package'
            }
        }
        stage('docker setup') {
            steps {
            sh 'docker run hello-world'
            }
        }
		stage('docker') {
		when {
		  branch 'master'
		}
            steps {
           withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'u')]) {
				sh 'docker login'
				sh 'docker build --rm . -t nikneal91/nagp-demo'
				sh 'docker push nikneal91/nagp-demo'
			}
            }
			steps {
			echo 'hello-world'
			}
        }
		
    }
}
