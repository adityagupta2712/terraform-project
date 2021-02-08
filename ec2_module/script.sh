#! /bin/bash
sudo yum update -y
sudo yum install -y git
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs
sudo git clone https://github.com/adityagupta2712/nodejs-mysql-crud.git /opt/nodejs-mysql-crud
cd /opt/nodejs-mysql-crud
echo "var config = {
	database: {
		host:	  'localhost', 	// database host
		user: 	  'root', 		// your database username
		password: 'Aditya12#4', 		// your database password
		port: 	  3306, 		// default MySQL port
		db: 	  'test' 		// your database name
	},
	server: {
		host: '127.0.0.1',
		port: '80'
	}
}

module.exports = config" | sudo tee /opt/nodejs-mysql-crud/config.js
sudo npm install
sudo node app.js
