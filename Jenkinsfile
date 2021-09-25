pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script{
                    sh "ls"
                    sh "docker build prateekjaindev/flask-app ."
                    sh "docker tag build prateekjaindev/flask-app build prateekjaindev/flask-app"
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
