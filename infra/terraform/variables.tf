variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
  default     = "devops-challenge-flask-angular"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.small"
}

variable "ssh_allowed_cidr" {
  description = "CIDR permitido para acceso SSH"
  type        = string
}

variable "key_pair_name" {
  description = "Nombre del Key Pair en AWS"
  type        = string
}
