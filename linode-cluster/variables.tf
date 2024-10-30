variable "linode_access_token" {
  type        = string
  description = "This is the Linode access token to create resources in Linode."
}

variable "linode_ssh_key_path" {
  type        = string
  description = "This is the SSH Key for connecting to Linode instance."
}

variable "linode_ssh_root_password" {
  type        = string
  description = "This is the Linode access token to create resources in Linode."
}

variable "rancher_bootstrap_password" {
  type        = string
  description = "This is the bootstrap password that gets assigned to login to the Rancher UI."
}


