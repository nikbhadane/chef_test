node {
   stage('Fetch latest code') {
       checkout scm
   }
   stage('Build Docker image') {
       sh 'ls -al ; git branch; df -h; sleep 45'
       sh 'echo "This is testing of new JenkinsFile under hellowordapp"'
       }
}
