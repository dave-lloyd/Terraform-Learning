
# Data Sources
data "vsphere_datacenter" "dc" {
  name = var.datacenter_name

}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.portgroup_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Using an SDRS cluster. If one doesn't exist, use a vsphere_datastore data source instead and appropriate variable.
data "vsphere_datastore_cluster" "my_datastore_cluster" {
  name          = var.sdrs_cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "wintemplate" {
  name          = var.windows_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Virtual Machine Resource
resource "vsphere_virtual_machine" "winvm1" { # winvm1 is the name of this particular resource in terraform - not the name of the VM or hostname
  name                 = "terraformwin1"           # Name as it will appear in vCenter
  resource_pool_id     = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id = data.vsphere_datastore_cluster.my_datastore_cluster.id
  num_cpus             = 1
  memory               = 1024
  guest_id             = data.vsphere_virtual_machine.wintemplate.guest_id
  scsi_type            = data.vsphere_virtual_machine.wintemplate.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.wintemplate.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.wintemplate.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.wintemplate.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.wintemplate.id

    customize {
      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = 24
      }
      ipv4_gateway    = var.vm_gw
      dns_server_list = [var.vm_dns]

      windows_options {
        computer_name  = var.vmname
        admin_password = var.admin_pass
      } # windows_options
    }   # customize
  }     # clone

}   # resource

output "ip" {
  value = vsphere_virtual_machine.winvm1.default_ip_address

}