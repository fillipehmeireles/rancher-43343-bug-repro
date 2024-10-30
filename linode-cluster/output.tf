output "instance_ips" {
  value = linode_instance.fillipe_qa_instance[*].ipv4
}
