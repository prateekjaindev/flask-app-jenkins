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
                    
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "docker tag prateekjaindev/flask-app prateekjaindev/flask-app:v1"
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push prateekjaindev/flask-app"
                    }
                }
            }
        }
    }
}
