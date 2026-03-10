variable "instance_name" {
  description = "Value of EC2 instance name tag"
  type        = string
  default     = "learn-terraform"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name of the existing EC2 Key Pair to use for SSH access"
  type        = string
  default     = "devops"
}