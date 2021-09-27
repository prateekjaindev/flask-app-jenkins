#!/usr/bin/env groovy

def gv

pipeline {
    agent any

    stages {

        stage("test") {
            steps {
                script {
                    echo "Branch Name $BRANCH_NAME"
                }
            }
        }

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
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script{
                   gv.buildImage()
                }
            }
        }
        
         stage('Pushing Image to DockerHub') {
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                    gv.pushImage()
                    }
                }
            }
        }
    }

