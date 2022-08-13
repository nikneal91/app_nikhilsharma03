pipeline {
    agent any
tools { 
      maven 'MAVEN3'
      jdk 'jdk8'
    }
    stages { 
        stage('Build') {
            steps {
            sh 'mvn clean package'
            }
        }
        stage('Test Case Execution') {
			when {
				branch 'develop'
			}         
			steps {
				dir("DemoSampleApp_Jmeter") {
						sh "mvn clean -Pperformance verify"
				}    
			}
        }
		stage('SonarQube Analysis') {
		when {
		  branch 'master'
		}        
		steps {
            sh 'echo sonar qube'
            }
        }
		stage('docker') {
		when {
		  branch 'master'
		}
            steps {
           withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'u')]) {
				sh 'docker login'
				sh 'docker build --rm . -t nikneal91/i-nikhilsharma03-develop:latest'
				sh 'docker push nikneal91/i-nikhilsharma03-develop:latest'
			}
            }
        }
		
    }
}
