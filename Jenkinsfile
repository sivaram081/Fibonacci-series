pipeline {
    agent any
    stages {
        stage('Run Fibonacci Script') {
            steps {
                echo 'Generating Fibonacci series for 10 terms...'
                sh 'chmod +x fibonacci-series.sh'
                sh './fibonacci-series.sh'
            }
        }
    }
    post {
        failure {
            echo '❌ Fibonacci pipeline failed!'
        }
        success {
            echo '✅ Fibonacci pipeline completed successfully!'
        }
    }
}

