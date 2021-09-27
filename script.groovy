def buildImage() {
    sh "ls"
    sh "docker build -t flask-app ."
}

def pushImage() {
    sh "docker tag flask-app prateekjain/flask-app:v1"
    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
    sh "echo $PASS | docker login -u $USER --password-stdin"
    sh "docker push prateekjain/flask-app:v1"
    }

}

return this