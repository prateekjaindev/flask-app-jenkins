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
                     def dockerCompose = "docker-compose -f docker-compose.yaml up --detach"
                     sshagent(['ec2-key']) {
                        sh "scp docker-compose.yaml ubuntu@52.66.224.110:/home/ubuntu"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@52.66.224.110 ${dockerCompose}"
                    }
                 }
             }
         }
        }
    }

