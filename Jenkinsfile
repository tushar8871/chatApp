pipeline {
	agent any
	stages {
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
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



