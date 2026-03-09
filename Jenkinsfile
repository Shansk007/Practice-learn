pipeline {
    agent any

    environment {
        AWS_REGION = 'au-east-1'
        ECR_REPO = '416851286705.dkr.ecr.us-east-1.amazonaws.com/shan/image'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Shansk007/Practice-learn.git'
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker Image"
                sh """
                docker build -t my-app:${IMAGE_TAG} .
                docker tag my-app:${IMAGE_TAG} ${ECR_REPO}:${IMAGE_TAG}
                """
            }
        }

        stage('Login to AWS ECR') {
            steps {
                echo "Logging into ECR"
                sh """
                aws ecr get-login-password --region ${AWS_REGION} | \
                docker login --username AWS --password-stdin ${ECR_REPO}
                """
            }
        }

        stage('Push Image to ECR') {
            steps {
                echo "Pushing image to ECR"
                sh """
                docker push ${ECR_REPO}:${IMAGE_TAG}
                """
            }
        }

    }

    post {
        success {
            echo "Docker image pushed to ECR successfully"
        }

        failure {
            echo "Pipeline failed"
        }

        always {
            echo "Cleaning workspace"
            cleanWs()
        }
    }
}