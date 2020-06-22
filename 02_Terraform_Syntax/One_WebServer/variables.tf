variable "alarms_email" {
  description = "The email address subscribed to AWS SNS topic"
  type        = string
  default     = "jeff.gu@yourdomainname.com"
}

variable "instance_count" {
  description = "The number of instances to be created"
  type        = number
  default     = "1"
}
