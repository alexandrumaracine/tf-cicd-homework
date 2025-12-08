data "azurerm_resource_group" "rg" {
  name = "testHomework"
}

module "storage_accounts" {
  source = "./modules/storage_account"

  for_each = {
    sa1 = "alexmarasa001"
    sa2 = "alexmarasa002"
    sa3 = "alexmarasa003"
  }

  name                = each.value
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  tags = {
    Owner = "AlexMara"
  }
}
