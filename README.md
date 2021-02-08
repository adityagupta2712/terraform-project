# terraform-project

This terraform project will create two-tier infrastructure in AWS cloud.

Based on your machine install below requirements-

steps to use this repository-
1- install aws-cli -- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
2- install terraform -- https://learn.hashicorp.com/tutorials/terraform/install-cli

3- create a aws profile in your aws credentials files to use with terraform -
default path of credentials file <userhome>/.aws/credentials

4- update your profile -  in main.tf file ex-   profile = "terraform-adi" //update your user-profile for aws keys
i have used singapore region for my infrastructure you can change according to your requirement.

5- clone this project in your machine.
6- run below commands inside project directory.

a- terraform init (this command will initialize terraform in project folder).

b- terraform plan  (this command will list down all the resources it is going to create in aws).

c- terraform apply (this command will create infrastructure in aws, to verify please login to console and verify).

d- terraform destroy (this command will destroy all the infrastructure created with terraform apply).
  
  
  
