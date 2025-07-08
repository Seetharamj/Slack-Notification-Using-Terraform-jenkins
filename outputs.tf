output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.Terraform-EC2.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.Terraform-EC2.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.Terraform-EC2.public_dns
}

output "availability_zone" {
  description = "AZ in which the EC2 instance was launched"
  value       = aws_instance.Terraform-EC2.availability_zone
}
