pipeline {
    agent any

    stages {
        stage('System Update') {
            steps {
                echo 'Updating system packages...'
                sh ' apt update'
            }
        }

        stage('Check System Status') {
            steps {
                echo 'Checking uptime...'
                sh 'uptime'
                
                echo 'Checking current date...'
                sh 'date'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project... hello 123445566'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests... so now running fine'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}