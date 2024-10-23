pipeline {
    agent any

tools {
        maven 'Maven_3.8.1'  // Usa el nombre que configuraste para Maven en Jenkins
    }
    stages {
        stage('Build') {
            steps {
                // Construye el proyecto usando Maven o Gradle
                sh 'mvn clean package'  // Si usas Maven
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construye la imagen Docker
                sh 'docker build -t curso-DevOps .'
            }
        }

        stage('Deploy') {
            steps {
                //stop docker
                sh "docker stop curso-DevOps || true"
                // Aquí puedes definir pasos para desplegar la imagen Docker
                sh 'docker run -d -p 8081:8081 curso-DevOps'
            }
        }
    }
}
