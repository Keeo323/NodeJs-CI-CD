pipeline {
    agent { label 'Built-In Node' }

    tools {
        nodejs 'NodeJs'   // use EXACT name shown in Manage Jenkins → Tools
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
