pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                // Construye la imagen Docker, que también compila el proyecto
                sh 'docker build -t curso-devops .'
            }
        }

        stage('Deploy') {
            steps {
                // Detiene y elimina el contenedor en ejecución si existe
                script {
                    sh 'docker stop curso-devops || true'
                    sh 'docker rm curso-devops || true'
                }

                // Inicia un nuevo contenedor usando la imagen construida
                sh 'docker run -d -p 9000:9000 --name curso-devops curso-devops'
            }
        }
    }
}
