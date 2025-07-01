pipeline {
    agent any

    parameters {
        string(name: 'BUILD_VERSION', description: 'Docker image tag version')
    }

    environment {
        DOCKER_IMAGE_NAME = 'sybozz/demo-app'
        GIT_REPO_URL = 'https://github.com/sybozz/devops-04.git'
        GIT_BRANCH = 'jenkins-project-01'
    }

    stages {
  
       stage('Cleanup Workspace'){
            steps{
                script{
                    cleanWs()
                }
            }
        }
  
        stage('Print Parameters') {
            steps {
                echo "Build Version: ${params.BUILD_VERSION}"
            }
        }

        stage('Checkout Git Repo') {
            steps {
                git branch: "${env.GIT_BRANCH}", url: "${env.GIT_REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageTag = "${DOCKER_IMAGE_NAME}:${params.BUILD_VERSION}"
                    echo "Building Docker image: ${imageTag}"
                    sh "docker build --no-cache -t ${imageTag} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    def imageTag = "${DOCKER_IMAGE_NAME}:${params.BUILD_VERSION}"
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                        sh """
                            echo \$DOCKERHUB_PASS | docker login -u \$DOCKERHUB_USER --password-stdin
                            docker push ${imageTag}
                            docker logout
                        """
                    }
                }
            }
        }
    }
}
