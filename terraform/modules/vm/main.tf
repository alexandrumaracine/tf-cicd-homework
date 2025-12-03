resource "null_resource" "this" {
  triggers = {
    name   = var.name
    image  = var.image
    cpus   = tostring(var.cpus)
    memory = tostring(var.memory)
  }
}
