pipeline {
    agent 'Built-In Node'

    tools {
        nodejs 'NodeJS'   // Make sure you configured a NodeJS tool in Jenkins (Manage Jenkins → Tools)
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