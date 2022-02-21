pipeline {
  agent { dockerfile true }
  stages {
    stage('Checkout') {
      steps {
        sh 'git clone --recursive https://github.com/nesbox/TIC-80 && cd TIC-80/build'
      }
    }
    stage('Build') {
      steps {
        sh 'cmake ..'
        sh 'make -j4'
      }
    }
    stage('Archive'){
      steps {
        archiveArtifacts '${WORKSPACE}/build/bin/*'
      }
    }
  }
}
