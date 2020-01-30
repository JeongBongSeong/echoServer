node {
    stage ('clone') {
        checkout scm
    }
    stage ('gradlew build') {
        if(isUnix()) {
            sh './gradlew clean build'
        }
        else{
            bat 'gradlew.bat clean build'
        }
    }
    stage ('analysis'){        
        if(isUnix()) {
            sh './gradlew check'
            checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '/config/checkstyle/main.xml', unHealthy: ''
        }
        else{
            bat 'gradlew.bat check'
        }
    }
    stage ('Packaging'){
        if(isUnix()) {
            sh './gradlew clean bootjar'
        }
        else{
            bat 'gradlew.bat clean bootjar'
        }
    }
    stage ('Docker Build'){
        if(isUnix()) {
            sh 'docker build -t jars . && docker tag jars localhost:5000/jars:latest && docker push localhost:5000/jars'
        }
        else{
            bat 'docker build -t jars . && docker tag jars:latest localhost:5000/jars:latest && docker push localhost:5000/jars'
        }
    }
}
