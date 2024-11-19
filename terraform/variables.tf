variable "image_tag" {
  description = "The Docker image tag to use"
  type        = string
  default     = "latest" # Default to 'latest', but can be overridden
}