pipeline {
    agent any

    environment {
        SLACK_WEBHOOK = credentials('slack-webhook') 
    }

    stages {
        stage('Slack: Pipeline Started') {
            steps {
                sh '''
                curl -X POST -H 'Content-type: application/json' \
                --data '{"text":"🟡 *Pipeline Started:* `${JOB_NAME} #${BUILD_NUMBER}`"}' \
                $SLACK_WEBHOOK
                '''
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                dir('terraform') {
                    sh '''
                    terraform init
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }

    post {
        success {
            sh '''
            curl -X POST -H 'Content-type: application/json' \
            --data '{"text":"✅ *SUCCESS:* `${JOB_NAME} #${BUILD_NUMBER}`"}' \
            $SLACK_WEBHOOK
            '''
        }

        failure {
            sh '''
            curl -X POST -H 'Content-type: application/json' \
            --data '{"text":"❌ *FAILED:* `${JOB_NAME} #${BUILD_NUMBER}`"}' \
            $SLACK_WEBHOOK
            '''
        }
    }
}
