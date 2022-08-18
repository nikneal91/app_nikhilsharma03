pipeline {
    agent any
tools { 
      maven 'MAVEN3'
      jdk 'jdk8'
    }
    stages {
     stage('Branch test') {
                steps {
                sh "echo nikneal91/i-nikhilsharma03-${env.BRANCH_NAME}:latest"
    			}
                }
        stage('Build') {
            steps {
            sh 'mvn clean package'
            }
        }
        stage('docker image build') {
                    steps {
                   withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'u')]) {
        				sh 'docker login'
        				sh "docker build --rm . -t nikneal91/i-nikhilsharma03-${env.BRANCH_NAME}:latest"
        				sh "docker push nikneal91/i-nikhilsharma03-${env.BRANCH_NAME}:latest"
        			}
                    }
                }
                stage('start docker container') {
                when {
                		branch 'develop'
                	}
                steps {
                		sh "docker run -d -p 80:8080 --name devopssampleapplication nikneal91/i-nikhilsharma03-${env.BRANCH_NAME}:latest"

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
        stage('CleanUp docker container') {
                 when {
                 		 branch 'develop'
                 	  }
                    steps {
                        sh 'docker container stop devopssampleapplication'
        			    sh 'docker container rm devopssampleapplication'
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
        stage('kubernetes deployments') {
            steps {
                sh 'gcloud container clusters get-credentials nagp-gke --zone asia-southeast1-a --project dogwood-abacus-359409'
           		sh 'kubectl get nodes'
           		sh 'kubectl apply -f kubernetes/devOps-${env.BRANCH_NAME}.yml'      		
            }
        }
		
    }
}
