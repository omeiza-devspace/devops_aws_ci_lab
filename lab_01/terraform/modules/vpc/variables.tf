variable "region" {}
variable "vpc_name" {}
variable "vpc_cidr" {}

variable "az1_gateway_subnet_cidr" {
  description = "IP allocated to the public subnet CIDR ranges"
  type        = string
  default     = "10.0.1.0/24"
}

variable "az1_proxy_subnet_cidr" {
  description = "IP allocated to the private subnet CIDR ranges"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az1_compute_subnet_cidr" {
  description = "IP allocated to the database subnet CIDR ranges"
  type        = string
  default     = "10.0.3.0/24"
}

variable "az2_gateway_subnet_cidr" {
  description = "IP allocated to the public subnet CIDR ranges"
  type        = string
  default     = "10.0.4.0/24"
}

variable "az2_proxy_subnet_cidr" {
  description = "IP allocated to the private subnet CIDR ranges"
  type        = string
  default     = "10.0.5.0/24"
}

variable "az2_compute_subnet_cidr" {
  description = "IP allocated to the database subnet CIDR ranges"
  type        = string
  default     = "10.0.6.0/24"
}


