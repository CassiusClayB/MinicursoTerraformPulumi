variable "region" {
  default = "us-east-1"
}

variable "access_key" {}
variable "secret_key" {}

variable "ami_id" {
  description = "AMI para EC2 (ex: ami-0c55b159cbfafe1f0 para us-east-1)"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
}
