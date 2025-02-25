node {
    
   stage('Checkout Code from GIT')
   {
       git branch: 'main', url: 'https://github.com/neerajte/TestProjectGitHub.git'
   }
   
    stage('Maven Build')
   {
       def mavenHome = tool name: "Maven3.9.9", type: "maven"
       def mavenCMD = "${mavenHome}/bin/mvn"
       sh "${mavenCMD} clean package"
   }
    
 /*   stage('Sonar Code Review')
   {
       withSonarQubeEnv('SonarServer') {
    // some block
         def mavenHome = tool name: "Maven3.9.9", type: "maven"
       def mavenCMD = "${mavenHome}/bin/mvn"
      // sh "${mavenCMD} sonar:sonar"
       sh "${mavenCMD} clean verify sonar:sonar -Dsonar.projectKey=TestProjectGitHubSonar -Dsonar.projectName='TestProjectGitHubSonar'"

                       }
   }*/
   
   /* stage('Deploy the War file to Tomcat')
   {
       // chown -R ubuntu:ubuntu /opt
       // copy the key for SSHAGENT in tomcat .ssh folder
       sshagent(['SSHAGENT']) {
   sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/Maven-Pipeline/target/maven-web-app.war ubuntu@3.139.93.201:/opt/apache-tomcat-9.0.100/webapps'
       }
       
   }*/
   
    stage('Deploy the War file to Tomcat')
   {
   sh 'cp -f /var/lib/jenkins/workspace/Maven-Pipeline/target/maven-web-app.war /opt/apache-tomcat-9.0.100/webapps/ROOT.war'
   }
   
          stage('Build Docker Image') {
                sh "docker build -t neerajte/nkst:$BUILD_NUMBER ."
                }
                
                
                   stage('Docker Push Image to GITHUB') {
            withDockerRegistry(credentialsId: 'DockerToken') {
                sh "docker push neerajte/nkst:$BUILD_NUMBER"
            }
                }
                
                
                 stage('Deploy to Container and Run 9001') {
            withDockerRegistry(credentialsId: 'DockerToken') {
                sh "docker run -d -p 8090:80 neerajte/nkst:$BUILD_NUMBER"
            }
                }

        
      
          
        
}    
