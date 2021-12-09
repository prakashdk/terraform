Day4
Advanced Terraform Task (Assignment 5)	Make updates to the Assignment 4 terraform template with the following additional requirements:
    1. Create a separate module to provision VPC and subnets with environment tag value as "training"
    2. Create a separate module to provision an EC2 instance with the possible instance name, type, ami, count, tag values,            etc., as module inputs
    3. Use data resources to get the VPC and subnet details based on the tag name "environment=training"
    4. Use provisioner to deploy the MySQL-connection.php to the Apache2 instance /var/www/html/ with the provisioned RDS          instance as part of this template. 
