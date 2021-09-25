pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                ls
                sudo docker build prateekjaindev/flask-app .
                sudo docker tag build prateekjaindev/flask-app build prateekjaindev/flask-app
            }
        }
        
         stage('Pushing Image to DockerHub') {
            steps {
               echo "Pending..!!"
            }
        }
    }
}
