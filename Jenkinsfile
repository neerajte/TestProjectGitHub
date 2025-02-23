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
    
    stage('Sonar Code Review')
   {
       withSonarQubeEnv('SonarServer') {
    // some block
         def mavenHome = tool name: "Maven3.9.9", type: "maven"
       def mavenCMD = "${mavenHome}/bin/mvn"
      // sh "${mavenCMD} sonar:sonar"
       sh "${mavenCMD} clean verify sonar:sonar -Dsonar.projectKey=TestProjectGitHubSonar -Dsonar.projectName='TestProjectGitHubSonar'"

                       }
   }
        
}    
