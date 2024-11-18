resource "aws_ecs_task_definition" "bz_taskdef" {
  family                   = var.task_definition_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.bz_ecs_execution_role.arn

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = "${aws_ecr_repository.bz_ecr.repository_url}:${var.image_tag}"
    essential = true
    memory    = var.container_memory
    cpu       = var.container_cpu
    portMappings = [
      {
        containerPort = var.container_port
        hostPort      = var.container_port
        protocol      = "tcp"
      }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.ecs_log_group.name
        "awslogs-region"        = "eu-central-1"
        "awslogs-stream-prefix" = "bz-logs"
      }
    }
  }])

  tags = {
    Name = var.task_definition_name
  }
}

resource "aws_ecs_service" "bz_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.bz_cluster.id
  task_definition = aws_ecs_task_definition.bz_taskdef.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.bz_target_group.arn
    container_name   = var.container_name
    container_port   = 5000
  }

  network_configuration {
    subnets          = var.subnets
    security_groups = var.security_groups
    assign_public_ip = true
  }
  depends_on = [aws_ecs_task_definition.bz_taskdef]
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/bz-log-group"
  retention_in_days = 7
}
