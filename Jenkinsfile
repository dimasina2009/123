#!groovy
pipeline {
    agent {
        label 'master'
    }
    options {
        timestamps()
    }
    stages {
        stage("check") {
            steps {
                checkout scm
            }
        }
        stage("one") {
            steps{
                sh 'docker build -t 123/ws:0.1 .'
            }
        }
        stage("docker login") {
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker_hub_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u $USERNAME -p $PASSWORD"
                }
            }
        }
    }
}
