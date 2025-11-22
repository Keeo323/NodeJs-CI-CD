pipeline {
    agent any

    tools {
        nodejs 'NodeSystem'   // Your system Node installation
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

        stage('Docker Build') {
            steps {
                sh """
                    docker build -t node-backend:latest .
                """
            }
        }

        stage('Deploy Locally') {
            steps {
                sh """
                    # Stop old container if running
                    docker rm -f node-backend || true

                    # Start new container
                    docker run -d \
                        --name node-backend \
                        -p 3000:3000 \
                        node-backend:latest
                """
            }
        }
    }

    post {
        success {
            echo "Pipeline finished successfully. App running on http://localhost:3000"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}

