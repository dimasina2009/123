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
                sh 'if [ ! "$(docker ps -q -f name=ws)" ]; then\
                    if [ "$(docker ps -aq -f status=exited -f name=<name>)" ]; then\
                    docker rm ws\
                    fi\
                    docker run -d --name ws -p 80:80 gorchakovda/ws:0.1\
                    fi'
            }
        }
    }
}
