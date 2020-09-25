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
                sh 'docker build -t gorchakovda/ws:0.1 .'
            }
        }
        stage("docker login") {
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker_hub_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u $USERNAME -p $PASSWORD"
                }
                sh 'docker push gorchakovda/ws:0.1'
            }
        }
        stage("deploy") {
            steps{
                sh 'docker rm -f ws'
                sh 'docker run -d --name ws -p 80:80 gorchakovda/ws:0.1'
            }
        }
        stage("tests") {
            steps{
                try {         
                    new URL(http://localhost).getText()
                    return true
                } catch (Exception e) {
                    return false
                }
            }
        }
    }
}
