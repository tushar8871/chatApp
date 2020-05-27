pipeline {
	agent any
	stages {
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				echo "hello"
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



