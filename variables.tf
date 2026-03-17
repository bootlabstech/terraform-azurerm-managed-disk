#DISK 
variable "name" {
  type        = string
  description = "Specifies the name of the Managed Disk."

}
variable "location" {
  type        = string
  description = " Specified the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}
variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Managed Disk should exist"
}
variable "storage_account_type" {
  type        = string
  description = "The type of storage to use for the managed disk. Possible values are Standard_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS"
}
variable "create_option" {
  type        = string
  description = "The method to use when creating the managed disk. Possible values include Empty, Import, ImportSecure, Copy, FromImage, Restore, Upload"
  default     = "Empty"
}
variable "disk_size_gb" {
  type        = string
  description = " Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
}

# Attachment
variable "virtual_machine_id" {
  type = string
  description = "The self link of the VM"
}
variable "lun" {
  type        = string
  description = "The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine."
  default     = "10"
}
variable "caching" {
  type        = string
  description = "Specifies the caching requirements for this Data Disk. Possible values include None, ReadOnly and ReadWrite."
  default = "ReadWrite"
}
variable "network_access_policy" {
  type = string
  default = "AllowPrivate"
  
}
variable "disk_access_id" {
  type = string
  default = "AllowPrivate"
  
}
