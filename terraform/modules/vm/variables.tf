variable "name" {
  type = string
}

variable "image" {
  type        = string
  description = "The path to a base image file (VDI)."
}

variable "cpus" {
  type        = number
  default     = 1
}

variable "memory" {
  type        = number
  description = "Memory in MB"
  default     = 512
}
