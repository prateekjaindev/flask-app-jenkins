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
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')])
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push prateekjaindev/flask-app"
                }
            }
        }
    }
}
