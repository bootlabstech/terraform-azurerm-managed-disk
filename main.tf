# Creates additional managed disk resource
resource "azurerm_managed_disk" "disk" {
  name                 = var.name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  disk_access_id = azurerm_disk_access.example.id
  network_access_policy = var.network_access_policy

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
resource "azurerm_disk_access" "example" {
  name                = "${var.name}-diskacc"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Attaches disk to VM
resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = var.virtual_machine_id
  lun                = var.lun
  caching            = var.caching
}