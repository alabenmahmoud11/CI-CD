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
        
        
        stage('MAIL'){
 
 steps {

 mail bcc: '', body: '''Hello from IMEN,
 Devops Pipeline with success.
 Cordialement''', cc: '', from: '', replyTo: '', subject: 'Devops Timesheet', to: 'imen.mansouri@esprit.tn'
    
 }}
      
stage("6th Stage : Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "* File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: NEXUS_VERSION,
                            protocol: NEXUS_PROTOCOL,
                            nexusUrl: NEXUS_URL,
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: NEXUS_REPOSITORY,
                            credentialsId: NEXUS_CREDENTIAL_ID,
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "* File: ${artifactPath}, could not be found";
                    }
                }
            }
        }
}
}

