output "instance_hostname" {
  description = "The private DNS name of the EC2 instance"
  value       = aws_instance.app_server.private_dns
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}