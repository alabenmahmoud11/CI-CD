pipeline {
    environment { 
        registry = "omarfehrii/timesheet2" 
        registryCredential = 'dockerHub' 
        dockerImage = '' 
    }
agent any
stages{
stage('clone '){
steps {
//cleanWs()


bat "git clone -b omar https://github.com/yosra256/DevopsProject"
}

}

 stage('clean install and  package'){
 steps {
 bat "mvn clean -f DevopsProject"
 bat "mvn install -f DevopsProject"
 bat "mvn package -f DevopsProject"
 }

 }
 stage('Test unitaire'){

 steps{ bat "mvn test -f DevopsProject"
 }}
 stage('Test statique'){

 steps{ bat "mvn sonar:sonar -f DevopsProject"
 }}
 stage('Deploy'){
 steps {

 bat "mvn deploy -f DevopsProject"

 }


 }
 stage('Docker') { 

            steps {
		dir("DevopsProject") {
			bat "docker build -t dev ."
			
 	  	    bat "docker tag dev  omarfehrii/timesheet2"
 			//bat"docker login -u omarfehrii -p 123456789"
 			bat "docker push  omarfehrii/timesheet2"			
			
			
        }
        
    }
        } 
        
        

 stage('email'){
 
 steps {

 mail bcc: '', body: '''Hello from Omar,
 Devops Pipeline with success.

 Cordialement''', cc: '', from: '', replyTo: '', subject: 'Devops Timesheet', to: 'omar.fehriii@gmail.com'
    
 }}

}
}
