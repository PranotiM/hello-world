pipeline {
    agent {
        docker {
            image 'maven:docker'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('scm')
        {
            steps {
                git branch: 'master', url: "git@ssh.dev.azure.com:v3/HexaDevOpsAnalytics/DevOpsAnalytics/prasad-maven-project"
            }
            
        }
        stage('Build stage') 
        {
            steps 
            {
                sh 'mvn clean package'
            }
        }    
        stage('Static code analysis') 
        {
            steps 
            {
                sh 'verify sonar:sonar -Dsonar.projectKey=mavenproject -Dsonar.host.url=http://localhost:9000 -Dsonar.login=fc93de91cb6da2fef0fc52756897d53aacba31e5'
            }    
        }
    }
}
