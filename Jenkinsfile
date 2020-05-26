pipeline {
	agent any
	stages {
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				$(aws ecr get-login --registry-ids 760496128264 --no-include-email --reg$
				docker-compose up -d
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



