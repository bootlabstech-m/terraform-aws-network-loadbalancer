variable "lb_name"{
  description="Name"
  type=string
}

variable "internal" {
  type = bool
  description = "scheme routes to either internet or internal, true for internal, false for internet-facing"
}

variable "region"{
  description="Region"
  type=string
}

variable "security_groups" {
  description = "Security Groups for VPC subnets in resources"
  type = list(string)
}

variable "subnets"{
  description="subnets"
  type = list(string)
}

variable "target_group_name" {
    description = "Target Group Name"
    type = string  
}

variable "target_port" {
  type = number
  description = "target group port"
}

variable "target_protocol" {
  type = string
  description = "target group protocol eg. HTTP/S, TCP"
}

variable "vpc_id" {
    description = "Shared VPC id"
    type = string
}

variable "target_type" {
    description = "Type of target group eg, instance,alb, lambda,ip "
    type = string
}

variable "target_id" {
  type = string
  description = "instance id"
}

variable "listener_port" {
  type = number
  description = "listener port"
}

variable "listener_protocol" {
  type = string
  description = "Protocol for connections from clients to the load balancer"
}

variable "ssl_policy" {
  type = string
  description = "ssl policy, only used in https protocol"
}

variable "certificate_arn" {
  type = string
  description = "certificate arn value for ssl, used only in https protocol"
}
variable "role_arn" {
  type = string  
  description = "Role ARN"
 }

 variable "ip_address_type" {
  type = string  
  description = "ip_address_type"
 }
 variable "load_balancer_type" {
  type = string  
  description = "load_balancer_type"
 }
