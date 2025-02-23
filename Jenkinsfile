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
       sh "${mavenCMD} clean verify sonar:sonar \
  -Dsonar.projectKey=TestProjectGitHubSonar \
  -Dsonar.projectName='TestProjectGitHubSonar' \
  -Dsonar.host.url=http://18.220.192.113:9000 \
  -Dsonar.token=sqp_84cf884ece2fa5caccb9507967aba7179e7bce56"

                       }
   }
        
}    
