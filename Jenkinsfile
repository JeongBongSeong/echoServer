node {
    stages {
        stage ('clone') {
            checkout scm
        }
    }
    stages{
        stage ('gradlew build') {
            if(isUnix()) {
                sh '/*sudo */./gradlew clean build'
            }
            else{
                bat 'gradlew.bat clean build'
            }
        }
        stage ('Packaging'){
            if(isUnix()) {
                sh '/*sudo */./gradlew clean bootjar'
            }
            else{
                bat 'gradlew.bat clean bootjar'
            }
        }
        stage ('Docker Build'){
            if(isUnix()) {
                sh 'docker build -t jars .'//&& /*sudo */docker tag jars qhdtjd0104/jars:latest && /*sudo */docker push qhdtjd0104/jars'
            }
            else{

                bat 'docker build -t jars . && docker tag jars:latest localhost:5001/jars:latest && docker push localhost:5001/jars'
            }
        }
    }
}
