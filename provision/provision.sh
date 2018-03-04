	apt-get update
    apt-get install -y nano git
    apt-get install -y openjdk-8-jdk openjdk-8-jdk-headless maven
    apt-get install -y ruby
    apt-get install -y python python-pip
    apt-get install -y python3 python3-pip
    
	# nodejs & npm
    if [ ! -f /usr/bin/nodejs ]; then
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
        apt-get install -y nodejs
        sudo apt-get install -y build-essential
        npm install -g grunt-cli gulp-cli bower
    fi
    
	# jenkins
    if [ ! -d /var/lib/jenkins ]; then
        wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
        if [ ! -f /etc/apt/sources.list.d/jenkins.list ]; then
            echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list.d/jenkins.list
        fi
        apt-get update
        apt-get install jenkins -y
    fi
    
	# docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update
	apt-cache policy docker-ce
	apt-get install -y docker-ce
	systemctl status docker
	
	usermod -a -G docker ${USER}
	usermod -a -G docker vagrant
	usermod -a -G docker jenkins
	
	service jenkins restart
    	
	jk_usr="admin"
	jk_pwd="no password. Security is disabled."
	if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
		jk_pwd=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
    fi
	
	echo "============= JENKINS USER & PWD ==============="	
	echo "$jk_usr"
    echo "$jk_pwd"
	echo "================================================"
	
	
	