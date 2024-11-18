resource "aws_iam_role" "bz_ecs_execution_role" {
  name = "bzEcsExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })

  tags = {
    Name = "bzEcsExecutionRole"
  }
}

# Attach the AmazonECSTaskExecutionRolePolicy policy to allow ECS to pull from ECR and write logs to CloudWatch
resource "aws_iam_role_policy_attachment" "ecs_execution_policy_attachment" {
  role       = aws_iam_role.bz_ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}