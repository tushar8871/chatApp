pipeline {
	agent any
	stages {
		stage('Clone Repository') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.7.252.181 '
				sudo rm -rf chatApp13/
				'
				scp -r /var/lib/jenkins/workspace/chatApp13 root@3.7.252.181:
				'''
			}
		}
		stage('Build Image') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.7.252.181 '
				cd chatApp13/
				$(aws ecr get-login --registry-ids 760496128264 --no-include-email --region ap-south-1)
				#docker-compose down 
				docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi -f chatapp13_chat:latest
				docker-compose up -d
				'
				'''
			}
		}
		stage('Push Image') {
			steps { 
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.7.252.181 '
				docker tag chatapp13_chat 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				docker push 760496128264.dkr.ecr.ap-south-1.amazonaws.com/chatapp:chatapp13_chat
				'
				'''
			}
		}
		stage('Deploy') {
			steps {
				sh ''' #! /bin/bash
				ssh -i /var/lib/jenkins/.ssh/id_rsa root@3.7.252.181 '
				kubectl delete $(kubectl get po -o=name | grep chat-deployment)
				,
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



