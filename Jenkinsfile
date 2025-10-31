pipeline {
    agent any
    stages {
        stage('Run Fibonacci Script Locally') {
            steps {
                echo 'Running Fibonacci script on the host for 10 terms...'
                sh 'chmod +x fibonacci-series.sh'
                sh './fibonacci-series.sh 10'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image for Fibonacci script...'
                // Ensure Dockerfile exists in repo
                sh 'docker build -t fibonacci-app:latest .'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container for 10 terms...'
                sh 'docker run --rm fibonacci-app:latest 10'
            }
        }
    }
    post {
        success {
            echo '✅ Fibonacci pipeline completed successfully!'
        }
        failure {
            echo '❌ Fibonacci pipeline failed!'
        }
    }
}

