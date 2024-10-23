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
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-nexus',  usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){
                                    sh 'docker login -u $USERNAME -p $PASSWORD'
                                    //sh 'docker tag curso-devops:latest m1guel1100/curso-devops-v2'
                                    //sh 'docker push m1guel1100/curso-devops-v2'

                                }
                // Detiene y elimina el contenedor en ejecución si existe
                script {
                    sh 'docker stop curso-devops || true'
                    sh 'docker rm curso-devops || true'
                }

                // Inicia un nuevo contenedor usando la imagen construida
                sh 'docker run -d -p 9001:9001 --name curso-devops curso-devops'
            }
        }
    }
}
