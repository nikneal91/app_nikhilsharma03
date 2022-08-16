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
        stage('docker image build') {
                    steps {
                   withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'u')]) {
        				sh 'docker login'
        				sh 'docker build --rm . -t nikneal91/i-nikhilsharma03-develop:latest'
        				sh 'docker push nikneal91/i-nikhilsharma03-develop:latest'
        			}
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
            sh 'mvn sonar:sonar -Dsonar.host.url=http://127.0.0.1:9000 -Dsonar.projectKey=Test_Sonar  -Dsonar.login=sqa_6963ca2eab5354e94ee5bfadbd7a94f02fe515a2'
            }
        }

		
    }
}
