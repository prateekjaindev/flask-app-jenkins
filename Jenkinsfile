pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sudo docker build prateekjaindev/flask-app .
                sudo docker tag build prateekjaindev/flask-app build prateekjaindev/flask-app
            }
        }
        
         stage('Pushing Image to DockerHub') {
            steps {
               # sudo docker push prateekjaindev/flask-app:v1
            }
        }
    }
}
