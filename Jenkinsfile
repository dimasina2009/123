#!groovy
pipeline {
    agent {
        label 'master'
    }
    options {
        timestamps()
    }
    environment {
        BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
    }
    stages {
        stage("check") {
            steps {
                echo $BRANCH_NAME
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
                sh 'docker run -d --name ws -p 88:80 gorchakovda/ws:0.1'
            }
        }
        stage("tests") {
            steps {
                script {
                    try {
                        sh "curl -s --head  --request GET  http://localhost:88 | grep '200'"
                        return true
                    } catch (Exception e) {
                        return false
                    }
                }
            }
        }
    }
}
