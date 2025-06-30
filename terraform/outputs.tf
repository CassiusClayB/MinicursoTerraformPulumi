output "ec2_simulated_file" {
  value = local_file.ec2_simulation.filename
}

output "s3_simulated_file" {
  value = local_file.s3_simulation.filename
}
