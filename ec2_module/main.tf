resource "aws_instance" "web_server_1" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "aditya"
  security_groups = [aws_security_group.ec2_sg.id]
  # Public Subnet assign to instance
  subnet_id = var.public_subnet_id_1
  user_data = file("ec2_module/script.sh")

  tags = {
    Name = "web server-1"
  }
}

resource "aws_instance" "web_server_2" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "aditya"
  security_groups = [aws_security_group.ec2_sg.id]
  # Public Subnet assign to instance
  subnet_id = var.public_subnet_id_2
  user_data = file("ec2_module/script.sh")

  tags = {
    Name = "web server-2"
  }
}
