pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script{
                    sh "ls"
                    sh "docker build -t prateekjaindev/flask-app ."
                   
                }
            }
        }
        
         stage('Pushing Image to DockerHub') {
            steps {
                script {
                     sh "docker tag prateekjaindev/flask-app prateekjaindev/flask-app"
                    echo "Pending..!!"
                }
            }
        }
    }
}
