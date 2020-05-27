pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
            sh ''' #! /bin/bash
            ssh -i /var/lib/jenkins/.ssh/id_rsa ubuntu@13.126.129.118 '
            sudo rm -rf /home/ubuntu/chatApp13
            '
            scp -r /var/lib/jenkins/workspace/chatApp13 ubuntu@13.126.129.118:/home/ubuntu
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa ubuntu@13.126.129.118 '
				cd /home/ubuntu/chatApp13
				docker-compose up -d
				'
				'''
			}
		}
		stage('Deploy') {
			steps {
				sh ''' #! /bin/bash
				echo Deploy Successfull
				'''
			}
		}

	}
	post {
		always {
			echo 'Stage is success'
		}
	}
}



