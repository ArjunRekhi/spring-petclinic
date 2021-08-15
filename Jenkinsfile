pipeline {
    agent any 
    stages {
        stage('Starting the website in a docker container ') { 
            steps {
                sh '''
if  sudo  docker ps -a | grep owasp-pet-zap
then
echo "Stopping the container"
sudo docker rm -f owasp-pet-zap

fi

echo "Starting a new container"
sudo docker run -d -p 8080:8080 --name owasp-pet-zap owasp-pet-clinic:latest

        '''
            }
        }
        
     stage('ZAP-Check ') { 
            steps {
            sh '''
#ZAP Check
if [ -f "zap.sh" ]; then
rm -rf zap.sh
fi

wget 'https://raw.githubusercontent.com/ArjunRekhi/OWASP-Jenkins/master/zap.sh'
chmod +x zap.sh
sudo sh zap.sh http://192.168.149.128:8080/
        '''
            
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'ZapReports', reportFiles: 'ZAP_Report_Alert.html', reportName: 'ZAP Report', reportTitles: ''])
            }
        }
        
        
    stage('Dependency-Check ') { 
            steps {
            sh '''
#Dependency-Check
if [ -f "dependency-check.sh" ]; then
rm -rf dependency-check.sh
fi

sudo wget 'https://raw.githubusercontent.com/ArjunRekhi/OWASP-Jenkins/master/dependency-check.sh'
sudo chmod +x dependency-check.sh
sudo sh dependency-check.sh
        '''
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'OWASP-Dependency-Check/reports', reportFiles: 'dependency-check-report.html', reportName: 'Dependency-Check-Report', reportTitles: ''])
                        }
        }
        
    }
}
