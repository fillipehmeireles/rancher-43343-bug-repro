terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.28.0"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.linode_access_token
}


# Create a Linode
resource "linode_instance" "fillipe_qa_instance" {
  label           = "fillipe-qa-43343"
  image           = "linode/ubuntu22.04"
  region          = "us-west"
  type            = "g6-standard-6"
  authorized_keys = [chomp(file(var.linode_ssh_key_path))]
  root_pass       = var.linode_ssh_root_password

  connection {
    type     = "ssh"
    user     = "root"
    password = var.linode_ssh_root_password
    host     = one(self.ipv4)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo curl https://releases.rancher.com/install-docker/26.0.sh | sh"
    ]
  }
}
