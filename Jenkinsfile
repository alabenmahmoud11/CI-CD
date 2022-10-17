pipeline {
    environment { 
        registry = "soulaymendocker123/123456789" 
        registryCredential = 'dockerHub' 
        dockerImage = '' 
    }
agent any
stages{
stage('clone '){
steps {
cleanWs()


sh "git clone -b soulaymen https://github.com/Zeroxcharisma/CI-CD"
}

}

 stage('clean install and  package'){
 steps {
 sh "mvn clean -f CI-CD"
 sh "mvn install -f CI-CD"
 sh "mvn package -f CI-CD"
 }

 }
 stage('Test unitaire'){

 steps{ sh "mvn test -f CI-CD"
 }}
 stage('Test statique'){

 steps{ sh "mvn sonar:sonar -f CI-CD"
 }}
 stage('Deploy'){
 steps {

 sh "mvn deploy -f CI-CD"

 }


 }
 stage('Docker') { 

            steps {
		dir("CI-CD") {
			sh "docker build -t dev ."
			
 	  	    sh "docker tag dev  omarfehrii/timesheet2"
 			//sh"docker login -u omarfehrii -p 123456789"
 			sh "docker push  omarfehrii/timesheet2"			
			
			
        }
        
    }
        } 
        
        

 stage('email'){
 
 steps {

 mail bcc: '', body: '''Hello from Soulaymen,
 Devops Pipeline with success.

 Cordialement''', cc: '', from: '', replyTo: '', subject: 'Devops Timesheet', to: 'soulaymen@gmail.com'
    
 }}

}
}
