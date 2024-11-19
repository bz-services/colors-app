variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "bz-cluster"
}

variable "task_definition_name" {
  description = "The name of the ECS task definition"
  type        = string
  default     = "bz-app"
}

variable "container_name" {
  description = "The name of the container within the task definition"
  type        = string
  default     = "bz-app"
}

variable "image_tag" {
  description = "The Docker image tag to use"
  type        = string
  default     = "latest"  # Default to 'latest', but can be overridden
}

variable "container_memory" {
  description = "Memory allocation for the container in MiB"
  type        = number
  default     = 512
}

variable "container_cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "container_port" {
  description = "Port to expose for the container"
  type        = number
  default     = 5000
}

variable "cpu" {
  description = "The number of CPU units to allocate to the task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "The amount of memory (in MiB) to allocate to the task"
  type        = number
  default     = 512
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "bz-app"
}

variable "vpc_id" {
  description = "The ID of VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the ECS task"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for the ECS task"
  type        = list(string)
}

variable "lb_security_groups" {
  description = "List of security group IDs for the loadbalancer"
  type        = list(string)
}

variable "desired_count" {
  description = "The number of task instances to run in the ECS service"
  type        = number
  default     = 2
}
