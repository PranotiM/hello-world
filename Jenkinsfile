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
                git branch: 'master', url: "https://github.com/PranotiM/hello-world.git"
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
                withSonarQubeEnv('Local Sonar') 
                {
                    sh 'mvn clean package sonar:sonar'
                }
    
            }    
        }
    }
}

