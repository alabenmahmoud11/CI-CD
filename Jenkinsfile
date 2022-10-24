pipeline {
  agent any
  environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
      stage("GIT CHECKOUT") {
            steps {
                git branch: 'kaouther', credentialsId: 'git', url: 'https://github.com/Zeroxcharisma/CI-CD.git'
            }
        }
        stage('MVN CLEAN') {
      steps {
        sh 'mvn clean '
      }
    }
    stage('MVN COMPILE') {
      steps {
            sh 'mvn compile '
      }
    }
    
      //  stage('MVN TEST') {
       //     steps {
        //        sh 'mvn test'
        //    }
       // }
       stage("Maven BUILD") {
            steps {
                script {
                    sh "mvn install -DskipTests=true"
                }
            }
        }

      //  stage ('Maven Test Sonar') {
        //    steps {
//                sh 'cd achat'
            //    sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:RELEASE:sonar -Dsonar.login=admin -Dsonar.password=sonar'
           // }
//}
stage('MVN DEPLOY') {
      steps {
            sh 'mvn deploy -DskipTests=true '
      }
    }
    stage('BUILDING IMAGE'){
    steps {
        sh 'ls target/'
        sh 'docker build -t achatapp .'
    }
}
stage('push') {
        steps{
            
                sh 'echo $dockerhubpwd'
                    sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p dckr_pat_u-CpxgDhVIvsWbEP4IO3sGsoAu0'
                
                sh 'docker tag achatapp kaoutherch/achatapp'
                sh 'docker push kaoutherch/achatapp'
                
        }
        
        
        
        }
stage('docker compose'){
    steps {
        sh 'docker-compose up'
    }
}




}



}
