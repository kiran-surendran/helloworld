pipeline {
  agent any
  stages {
     stage('Checkout') {
      steps {
 	echo 'Copying MSGQ Lib' 
      }
     }

     stage('Unit tests') {
       agent {
        dockerfile {
	 dir "../${env.JOB_BASE_NAME}"
         additionalBuildArgs '--no-cache'
         args '-u 0:0 --cap-add NET_ADMIN -v ${HUDSON_HOME}/workspace/${JOB_BASE_NAME}:${HUDSON_HOME}/workspace/${JOB_BASE_NAME}:rw,z'
         } 
        }     
        environment {
             
            COPY_PATH = "${HUDSON_HOME}/workspace/${env.JOB_BASE_NAME}"
          }
        steps {
	   echo 'testing hook'
           sh 'pwd'
           sh 'cd /code/lanmanagement && python main.py >> out.log'
	   sh 'cp /code/lanmanagement/out.log $COPY_PATH && echo $COPY_PATH'
	script {
	   myVar = "ab"
	}	
dir('../') {
echo '${PWD}'
}
         }
      }
      stage('Report Building') {
         steps {
           sh 'pwd'
           echo "${myVar}"
         }
      }    
  	
  }
    
}
