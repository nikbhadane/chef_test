node {
   stage('Fetch latest code') {
       checkout scm
   }
   stage('Build Docker image') {
      // Remove old Docker image
      sh 'if [[ $(docker images | grep \'adtrack\') = *adtrack* ]]; then docker rmi adtrack:16.04 ; fi'
      // Build Docker image
      sh 'docker build -t adtrack:16.04 /site/target/'
      // Get the list of images        
      sh 'docker images'
   }
   stage('Stop and Remove existing container if exist') {
       // Verify if adtrack-16.04 container is already there
       sh 'if [[ $(docker ps -a | grep \'adtrck-local\') = *adtrck-local* ]]; then echo "Destroying adtrck-local Container it is already there"; docker ps -a; docker container stop adtrck-local; sleep 5;docker rm devv_02; sleep 5; fi'
   }
   stage('Create and run the Docker container') {
      // Create Docker container
      sh 'docker run -it -e "container=docker" --privileged=true -d --security-opt seccomp:unconfined --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 10443:10443 -h docker-test.example.com --mount type=bind,source="$(pwd)",target=/site --name devv_02 adtrack:16.04  bash -c "/sbin/init"'
      sh 'sleep 5'
   }
   stage('Setup the adtrack local environment') {
      // Setting adtrack-local
      sh 'docker exec devv_02 /bin/bash -c "su - vagrant; runuser -l vagrant -c \' ls; cd /site; sudo git clone https://github.marchex.com/marchex/adtrack-local.git; cd adtrack-local; make adtrack-ui adtrack-db\' "'
   }
   stage('Run the unit test') {
       // Running the Unit test inside Container.
      sh 'docker exec devv_02 /bin/bash -c "su - vagrant; runuser -l vagrant -c \' cd /site/adtrack-local; source ~/.bashrc; make run-adtrack-unit-test \' "'
   }
   stage('Destroy the Container') {
      // Destroying the container.
      sh 'docker ps -a; docker container stop devv_02; docker rm devv_02'
   }
   stage('Remove the image') {
      // Removing adtrack-16.04.
      sh 'docker rmi adtrack:16.04'
   }
}
