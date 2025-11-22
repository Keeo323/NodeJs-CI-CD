pipeline {
    agent any

    tools {
        nodejs 'NodeSystem'   // use EXACT name shown in Manage Jenkins → Tools
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
    }
}
