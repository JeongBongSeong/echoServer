node {
    stage ('clone') {
        checkout scm
    }
    stage ('clean') {
        if(isUnix()) {
            sh './gradlew clean'
        }
        else{
            bat 'gradlew.bat clean'
        }
    }
    stage ('analysis'){        
        if(isUnix()) {
            sh './gradlew check'
            checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports/checkstyle/main.xml', unHealthy: ''
            pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports//pmd/main.xml', unHealthy: ''
        }
        else{
            bat 'gradlew.bat check'
            checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports/checkstyle/main.xml', unHealthy: ''
            pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/build/reports//pmd/main.xml, infer-out/report.xml', unHealthy: ''
        }
    }
    stage ('build & Packaging') {
        if(isUnix()) {
            sh './gradlew build'
        }
        else{
            bat 'gradlew.bat build'
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
