resource "aws_ecs_cluster" "bz_cluster" {
  name = var.cluster_name

  tags = {
    Name = var.cluster_name
  }
}