variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  description = "Instance type for the instance"
  type        = string
  default     = "t2.micro"
} 

variable "vpc_id" {
  description = "VPC ID where the instance will be launched"
  type        = string 
}

variable "public_subnet_id" {
  description = "Public subnet ID for the instance"
  type        = string
}

variable "user_data" {
  description = "User data script for the instance"
  type        = string
}
