pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        CREDENTIALS=credentials('Docker')
        AWS=credentials('AWS')
    }
    stages {
        stage('Build image') {
            steps {
                sh 'mvn clean install'
                sh 'docker build -t margow/maven:latest .'
            }
        }
        stage('Login') {
			steps {
				sh 'echo $CREDENTIALS_PSW | docker login -u $CREDENTIALS_USR --password-stdin'
			}
		}
        stage('push image') {
            steps {
                sh 'docker push margow/maven:latest'
            }
        }
        stage ('K8S Deploy') {
            steps {
                withKubeConfig([credentialsId: 'K8s']) {
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl rollout restart deployment maven-app-deploy'
                }
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
