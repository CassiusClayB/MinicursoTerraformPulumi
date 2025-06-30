variable "profile" {
  type    = string
  default = "dev"
}

variable "ami_id" {
  description = "Simulação de AMI para EC2"
  default     = "ami-local-simulation"
}

variable "bucket_name" {
  description = "Simulação de nome de bucket S3"
  default     = "bucket-local-simulation"
}

