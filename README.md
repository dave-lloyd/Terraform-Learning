# Terraform learning examples

This repo is just a collection of Terraform configurations used for testing in trying to learn Terraform. This is not best practice or anything, but rather me trying things, seeing what works, what doesn't, and what works for me in terms of structure, layout and style.

There'll be small configurations, just doing singular, basic tasks - again, purely for learning purposes.

For the most part, I'm using a vSphere homelab, so, initially it's configurations that will use the vSphere provider.

In the configs, I'm using a terraform.tfvars.template file which outlines the variables being used, but without any values, ie, no credentials etc. Rename this file to terraform.tfvars and fill in the relevant values.

## DeployLinuxVM
Deploys a Linux VM from Template - CentOS7, sets host and domain name (make sure Perl is installed, otherwise this will fail), static IP and DNS server IP, and then uses the provisioner (just for testing purposes) to install and run Apache.

## DeployWindowsVM
Deploys a Windows VM from Template and set hostname, along with static IP and DNS server IP.

## DeployMultipleLinuxVM
Deploy a number of Linux VMs (pretty much same as the DeployLinuxVM one). No provisioner. Ugly way of constructing IP address. Define count and elements of the IP address in the terraform.tfvars.template file (which would then get renamed to terraform.tfvars). Pretty sure there's a better and more correct approach, but this is just trying to learn.