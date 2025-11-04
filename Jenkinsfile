pipeline {
    agent any
    
    stages {
        stage('Setup Docker Desktop Context') {
            steps {
                sh '''
                    # Switch to Docker Desktop context if available
                    docker context use desktop-linux || true
                    
                    # Disable credential helpers for this session
                    export DOCKER_BUILDKIT=0
                '''
            }
        }
        
        stage('Login with Desktop Credentials') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'docker-desktop-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        sh '''
                            # Login without credential store interference
                            docker login \
                                --username "$DOCKER_USER" \
                                --password "$DOCKER_PASS"
                        '''
                    }
                }
            }
        }
        
        stage('Build and Run') {
            steps {
                sh '''
                    docker build -t fibonacci-app:latest .
                    docker run --rm fibonacci-app:latest 10
                '''
            }
        }
    }
}


