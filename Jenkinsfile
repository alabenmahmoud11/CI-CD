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
//cleanWs()


bat "git clone -b soulaymen https://github.com/Zeroxcharisma/CI-CD"
}

}

 stage('clean install and  package'){
 steps {
 bat "mvn clean -f CI-CD"
 bat "mvn install -f CI-CD"
 bat "mvn package -f CI-CD"
 }

 }
 stage('Test unitaire'){

 steps{ bat "mvn test -f CI-CD"
 }}
 stage('Test statique'){

 steps{ bat "mvn sonar:sonar -f CI-CD"
 }}
 stage('Deploy'){
 steps {

 bat "mvn deploy -f CI-CD"

 }


 }
 stage('Docker') { 

            steps {
		dir("CI-CD") {
			bat "docker build -t dev ."
			
 	  	    bat "docker tag dev  omarfehrii/timesheet2"
 			//bat"docker login -u omarfehrii -p 123456789"
 			bat "docker push  omarfehrii/timesheet2"			
			
			
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
