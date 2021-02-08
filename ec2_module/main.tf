resource "aws_instance" "web_server_1" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "aditya"
  security_groups = [var.security_group_elb]
  # Public Subnet assign to instance
  subnet_id = var.public_subnet_id_1
  user_data = <<EOF
    #! /bin/bash
    sudo yum update -y
    sudo yum install -y httpd.x86_64
    sudo service httpd start
    sudo service httpd enable
    echo "<h1>Deployed ELB Instance Example 1</h1>" | sudo tee /var/www/html/index.html
  EOF

  tags = {
    Name = "web server-1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "aditya"
  security_groups = [var.security_group_elb]
  # Public Subnet assign to instance
  subnet_id = var.public_subnet_id_1

  user_data = <<EOF
    #! /bin/bash
    sudo yum update -y
    sudo yum install -y httpd.x86_64
    sudo service httpd start
    sudo service httpd enable
    echo "<h1>Deployed ELB Instance Example 2</h1>" | sudo tee /var/www/html/index.html
  EOF

  tags = {
    Name = "web server-2"
  }
}
