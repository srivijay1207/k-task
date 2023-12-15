node {
    def dockerHubCredentials = 'dockerHub'
    def dockerImageName = "reddy789/nginx"
    def dockerImageTag = "latest"
    def dockerHubRegistry = 'https://index.docker.io/v1/'
 
    stage('Checkout Code') {
        git 'https://github.com/srivijay1207/task-jenkins-docker.git'
    }
 
   stage('Build and Push Docker Image') {
        withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
            sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
            script {
                docker.withRegistry(dockerHubRegistry, dockerHubCredentials) {
                    def customImage = docker.build("${dockerImageName}:${dockerImageTag}", ".")  // Specify the Dockerfile location as "."
                    customImage.push()
                }
            }
        }
}
}