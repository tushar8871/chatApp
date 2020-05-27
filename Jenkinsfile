pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@13.126.129.118 '
				sudo rm -rf chatApp13/
				'
				scp -r /var/lib/jenkins/workspace/chatApp13 root@13.126.129.118:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@13.126.129.118 '
				cd chatApp13/
				 $(aws ecr get-login --registry-ids 760496128264 --no-include-email --region ap-south-1)
				docker-compose down 
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
		stage('Push Image') {
			docker.withRegistry([ credentialsId: "ecr", url: "" ]) {
				sh 'docker tag chatApp13_chat 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chat'
            			sh 'docker push 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp'
			}
		}

	}
	post {
		always {
			echo 'Stage is success'
		}
	}
}



