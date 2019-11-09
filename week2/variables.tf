variable "public_key_path" {
  description = "path to my public key"
  default = "~/.ssh/guild.pub"
}

variable "key_name" {
  description = "desired name of AWS Keypair"
  default = "paul_guild"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

# Ubuntu Xenial 16.04 (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}
