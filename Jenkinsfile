pipeline {
  agent {
    dockerfile {
        additionalBuildArgs  '--build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy'
        args '-e http_proxy=$http_proxy -e https_proxy=$https_proxy'
    }
  }
  environment {
      http_proxy = credentials('http-proxy')
      https_proxy = credentials('http-proxy')
  }
  stages {
    stage('Checkout') {
      steps {
        sh 'git clone --recursive https://github.com/nesbox/TIC-80 || { cd TIC-80 && git pull --recurse-submodules --jobs=4; }'
      }
    }
    stage('Build') {
      steps {
        sh 'cd TIC-80/build && cmake .. && make -j4'
      }
    }
    stage('Archive'){
      steps {
        archiveArtifacts 'TIC-80/build/bin/*'
      }
    }
  }
}
