# Terraform learning examples

This repo is just a collection of Terraform configurations used for testing in trying to learn Terraform. This is not best practice or anything, but rather me trying things, seeing what works, what doesn't, and what works for me in terms of structure, layout and style.

There'll be small configurations, just doing singular, basic tasks - again, purely for learning purposes.

For the most part, I'm using a vSphere homelab, so, initially it's configurations that will use the vSphere provider.

In the configs, I'm using a terraform.tfvars.template file which outlines the variables being used, but without any values, ie, no credentials etc. Rename this file to terraform.tfvars and fill in the relevant values.