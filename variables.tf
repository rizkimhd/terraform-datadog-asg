variable "product_domain" {
  type        = string
  description = "The name of the product domain which this ASG belongs to"
}

variable "cluster" {
  type        = string
  description = "The name of the cluster"
}

variable "environment" {
  type        = string
  default     = "*"
  description = "The name of the environment"
}