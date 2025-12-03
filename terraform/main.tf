locals {
  vm_names = {
    vm1 = "vm-one"
    vm2 = "vm-two"
    vm3 = "vm-three"
  }
}

module "vm" {
  source = "./modules/vm"

  # for_each creates named instances instead of index-based ones
  for_each = local.vm_names

  name   = each.value
  image  = var.vm_image
  cpus   = var.vm_cpus
  memory = var.vm_memory
}
