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

        stage('Provision EC2') {
            steps {
                environment {
                    AWS_ACCESS_KEY_ID = credentials('aws_access_key')
                    AWS_ACCESS_SECRET_KEY = credentials('aws_secret_key')
                    TF_VAR_env_prefix = 'test'
                }
                script {
                    dir('terraform')
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                        EC2_PUBLIC_IP = sh(
                            script: "terraform output ec2_public_ip"
                            returnStdout: true
                        ).trim()
                    }
                }
            }
        stage('Deploy to EC2') {
             steps {
                 script {
                     sh " figlet -w 1000 Creating EC2 Instace...!"
                     sleep(time: 90, unit: "SECOND")

                     sh " figlet -w 1000 Installing Packages...!"
                     def shellCmd = "bash ./commands.sh"
                     def ec2Instance = "ubuntu@${EC2_PUBLIC_IP}"
                     sshagent(['ec2-key']) {
                        sh "scp -o StrictHostKeyChecking=no commands.sh ${ec2Instance}:/home/ubuntu"
                        sh "scp -o StrictHostKeyChecking=no docker-compose.yaml ${ec2Instance}:/home/ubuntu"
                        sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${shellCmd}"
                    }
                 }
             }
         }
        }
    }

