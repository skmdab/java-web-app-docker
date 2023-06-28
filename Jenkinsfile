pipeline{
    
    agent{
        label 'slave'
    }

    stages{
        stage('Checkout the code'){
            steps{
                git branch: 'testing', url: 'https://github.com/skmdab/java-web-app-docker.git'
            }
        }

        stage('Build the web-app-docker image'){
            steps{
                dir('/tmp/java-web-app-docker'){
                sh "docker build -t skmdab/webapp:1 ."
                }
            }
        }

        stage('Deploying as container'){
            steps{
                sh "docker run -d --name webapp -p 8080:8080 skmdab/webapp:1"
            }
        }
    }
}
