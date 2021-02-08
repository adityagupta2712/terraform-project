output "ec2_name_1"{
  value = aws_instance.web_server_1.id
}
output "ec2_name_2"{
  value = aws_instance.web_server_2.id
}
