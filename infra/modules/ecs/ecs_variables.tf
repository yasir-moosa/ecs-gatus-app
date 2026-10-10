variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnets for the ECS tasks"
}

variable "ecs_task_sg_id" {
  type        = string
  description = "Security group for the ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN to attach the service to"
}

variable "app_port" {
  type        = number
  description = "Port the container listens on"
  default     = 80
}

variable "ecr_repo_name" {
  type        = string
  description = "ECR repository name to pull the app image from"
  default     = "ecs-gatus-repo"
}

variable "aws_region" {
  type        = string
  description = "AWS region (used for CloudWatch log config)"
}

variable "alb_dimension" {
  type        = string
  description = "ALB arn_suffix used to feed into CloudWatch dashboard metrics"
}
