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
                sh 'docker build .'
            }
        }
    }
}
