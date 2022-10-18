pipeline {
    agent any 
        environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "192.168.33.10:8081"
        NEXUS_REPOSITORY = "imenachat"
        NEXUS_CREDENTIAL_ID = "nexus-credentials"
        }    
    stages {
        stage ('Git') {
            steps {
                
                
                git 'https://github.com/Zeroxcharisma/CI-CD.git'
            }
        }
        stage ('cleaning with mvn') {
            steps {
//                sh 'cd achat'
                sh 'mvn clean'
            }
        }
        stage ('Compiling with mvn') {
            steps {
//                sh "cd achat"
                sh "mvn compile"
            }
        }

        
     stage ('Scan ') {
            steps {
               withSonarQubeEnv(installationName: 'jenkins-sonar', credentialsId: 'jenkins-sonar') {
                 sh 'mvn clean package sonar:sonar'
                }
            }
        
          
        }
    
        stage ('testing') {
            steps {
                echo 'hello world'
            }
        }
    stage ('nexus deploy') {
        steps {
            sh'mvn deploy '
            
        }
}
}
