pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script{
                    sh "ls"
                    sh "sudo docker build prateekjaindev/flask-app ."
                    sh "sudo docker tag build prateekjaindev/flask-app build prateekjaindev/flask-app"
                }
            }
        }
        
         stage('Pushing Image to DockerHub') {
            steps {
                script {
                    echo "Pending..!!"
                }
            }
        }
    }
}
