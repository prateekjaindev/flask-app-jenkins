#!/usr/bin/env groovy

def gv

pipeline {
    agent any
    options {
        timeout(time: 1, unit: 'HOURS') 
    }

    stages {

        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }

        stage('GitGuardian Scan') {
            agent {
                docker { image 'gitguardian/ggshield:latest' }
            }
            environment {
                GITGUARDIAN_API_KEY = credentials('gitguardian-api-key')
            }
            steps {
                sh 'ggshield scan ci'
            }
        }

        stage('Build Docker Image') {
            steps {
                script{
                   gv.buildImage()
                }
            }
        }
        
         stage('Pushing Image to DockerHub') {
            steps {
                script {
                    gv.pushImage()
                    }
                }
            }
         stage('Deploy to EC2') {
             steps {
                 script {
                     def dockerCmd = 'sudo docker run -dit -p 5000:5000 --name flask-app prateekjain/flask-app:v1'
                     sshagent(['ec2-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@52.66.224.110 ${dockerCmd}"
                    }
                 }
             }
         }
        }
    }

