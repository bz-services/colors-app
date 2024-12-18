# resource "aws_ecr_repository" "bz_ecr" {
#   name                 = "bz-app"
#   image_tag_mutability = "MUTABLE"
#   tags = {
#     Name = "bz-app"
#   }
# }

data "aws_ecr_repository" "bz_ecr" {
  name = "bz-app"
}

# Output the ECR repository URI
output "ecr_repository_uri" {
  description = "URI of the ECR repository"
  value       = data.aws_ecr_repository.bz_ecr.repository_url
}
