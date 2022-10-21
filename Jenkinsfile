pipeline {
    agent any 
    
    stages {
        stage ('Git') {
            steps {
                echo 'pulling...';
                git branch :'kaouther' ,
           
                url : 'https://github.com/Zeroxcharisma/CI-CD.git'
            }
        }
        
         
        
        
        
        
         stage ('Testing Maven') {
            steps {

                sh """mvn -version"""
            }
        }
        
        
        stage ('Maven Clean') {
            steps {
//                sh 'cd achat'
                sh 'mvn clean'
            }
        }
        stage ('Maven Compile') {
            steps {
//                sh "cd achat"
                sh "mvn compile"
            }
        }

        
      stage('Maven SONARQUBE') {
            steps {
               withSonarQubeEnv (installationName: 'jenkinssonar') {
   sh "mvn deploy"
            }
          
        }
      }
        
        
 
        

        stage ('Maven Test JUnit') {
            steps {
                echo 'hello world'
            }
        }
        stage ('Maven Deploy Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
    }
}
