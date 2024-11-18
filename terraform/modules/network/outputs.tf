# Output the VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.bz_vpc.id
}

# Output the Public Subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [aws_subnet.bz_public_subnet_1.id, aws_subnet.bz_public_subnet_2.id]
}

# Output the Security Group ID of ECS Task
output "bz_security_group_id" {
  description = "ID of the security group allowing inbound traffic on port 5000"
  value       = aws_security_group.bz_sg.id
}

# Output the Security Group ID of LoadBalancer
output "lb_security_group_id" {
  description = "ID of the security group allowing inbound traffic on port 80"
  value       = aws_security_group.lb_sg.id
}