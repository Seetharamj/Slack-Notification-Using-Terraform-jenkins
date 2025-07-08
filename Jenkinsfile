pipeline {
    agent any

    environment {
        SLACK_WEBHOOK = credentials('slack-webhook')
        GITHUB_REPO = 'https://github.com/Seetharamj/Slack-Notification-Using-Terraform-jenkins.git'
    }

    stages {
        stage('Slack: Pipeline Started') {
            steps {
                sh '''
               curl -X POST -H "Content-type: application/json" \
--data "{\"text\":\"🟡 *Pipeline Started* for job ${JOB_NAME} #${BUILD_NUMBER}\\n🔗 GitHub: ${GITHUB_REPO}\"}" \
"$SLACK_WEBHOOK"
'''
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                sh '''
                terraform init
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        success {
            sh '''
            curl -X POST -H "Content-type: application/json" \
            --data "{\"text\":\"✅ *SUCCESS:* ${JOB_NAME} #${BUILD_NUMBER}\\n🔗 GitHub: ${GITHUB_REPO}\"}" \
            "$SLACK_WEBHOOK"
            '''
        }

        failure {
            sh '''
            curl -X POST -H "Content-type: application/json" \
            --data "{\"text\":\"❌ *FAILED:* ${JOB_NAME} #${BUILD_NUMBER}\\n🔗 GitHub: ${GITHUB_REPO}\"}" \
            "$SLACK_WEBHOOK"
            '''
        }
    }
}
