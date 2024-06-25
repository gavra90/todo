pipeline {
    agent {
        docker { image 'mobiledevops/flutter-sdk-image:3.19.4' }
    }
    stages {
        stage('Flutter version') {
            steps {
                sh 'flutter --version'
            }
        }
    }
}