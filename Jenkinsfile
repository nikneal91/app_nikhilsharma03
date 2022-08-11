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
            sh 'docker -v'
            }
        }
    }
}
