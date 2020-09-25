#!groovy
pipeline {
    agent {
        label 'master'
    }
    options {
        timestamps()
    }
    stages {
        stage("one") {
            steps{
                sh 'docker build -t 123/ws:0.1 .'
            }
        }
    }
}
