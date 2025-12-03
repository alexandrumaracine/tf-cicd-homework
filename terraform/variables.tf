variable "vm_name" {
  type    = string
  default = "test-vm"
}

variable "vm_image" {
  type        = string
  description = "Local VDI file path"
  default     = "base-image.vdi"
}

variable "vm_cpus" {
  type    = number
  default = 1
}

variable "vm_memory" {
  type    = number
  default = 512
}
