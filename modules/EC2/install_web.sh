#!bin/bash
sudo yum install httpd -y
sudo echo "<h1>Hello from terraform!</h1>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd