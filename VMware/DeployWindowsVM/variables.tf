# provider
variable "username" {}
variable "password" {}
variable "vcenter" {}

# data blocks
variable "datacenter_name" {}
variable "cluster_name" {}
variable "sdrs_cluster_name" {}
#variable "datastore_name" {} # if using a datastore rather than SDRS cluster.
variable "portgroup_name" {}
variable "windows_template_name" {}

# template
variable "admin_pass" {}
variable "vmname" {}
variable "vm_ip" {}
variable "vm_gw" {}
variable "vm_dns" {}
variable "domain_name" {}