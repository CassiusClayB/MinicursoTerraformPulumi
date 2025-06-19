output "ec2_id" {
  value = aws_instance.example.id
}

output "s3_bucket" {
  value = aws_s3_bucket.example.bucket
}
