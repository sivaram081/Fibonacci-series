pipeline {
    agent any

    parameters {
        string(name: 'NUM_TERMS', defaultValue: '10', description: 'Enter number of Fibonacci terms to generate')
    }

    stages {
        stage('Run Fibonacci Script') {
            steps {
                echo "Generating Fibonacci series for ${params.NUM_TERMS} terms..."
                sh """
                    chmod +x fibonacci_series.sh
                    printf '${params.NUM_TERMS}\\n' | bash fibonacci_series.sh
                """
            }
        }
    }

    post {
        success { echo '✅ Fibonacci pipeline completed successfully!' }
        failure { echo '❌ Fibonacci pipeline failed!' }
    }
}

