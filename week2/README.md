# Week 2 Guild Solution

Terraform code is based on Terraform's [example of a two-tier AWS infrastructure](https://www.terraform.io/intro/examples/aws.html)

Provisioning is done via `user_data` in the interest of time and not delving into packer.

Unfortunately we could not get this code to work. There seems to be an issue around configuring the ELB to correctly forward the request to the instance.

