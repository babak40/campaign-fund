variable "key_name" {
  type = string
}

variable "template_file" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "monitoring" {
  type = bool
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
}

// EBS Variables
variable "delete_on_termination" {
  type = bool
}

variable "device_name" {
  type = string
}

variable "encrypted" {
  type = bool
}

variable "volume_size" {
  type = number
}

variable "volume_type" {
  type = string
}

variable "tags" {
  type = map(string)
}