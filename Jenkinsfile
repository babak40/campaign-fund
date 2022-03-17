pipeline {
  agent any
  triggers {
      githubPush()
  }
    
  stages {
        
    stage('Git') {
      steps {
        git 'https://github.com/babak40/campaign-fund.git'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Run') {
      steps {
        sh 'npm install'
         sh 'npm run dev'
      }
    }  
  }
}