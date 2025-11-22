pipeline {
    agent any

    tools {
        nodejs 'NodeSystem'
    }

    environment {
        APP_NAME = "node-backend"
        IMAGE_NAME = "node-backend:latest"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                echo 'Build step placeholder'
                // Only needed if you have a build step
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                script {
                    if (fileExists('package.json') && sh(script: "grep -q \"test\" package.json", returnStatus: true) == 0) {
                        sh 'npm test'
                    } else {
                        echo 'No test script found, skipping.'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                    docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Deploy Locally') {
            steps {
                echo "Deploying container locally..."
                sh """
                    # Stop old container if it exists
                    docker rm -f ${APP_NAME} || true

                    # Start new container
                    docker run -d --name ${APP_NAME} -p 3000:3000 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "Deployment complete. App should be live on http://localhost:3000"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}

