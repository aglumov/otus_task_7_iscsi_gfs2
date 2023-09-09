resource "local_file" "ansible_inventory" {
  filename        = "../ansible/inventory.ini"
  file_permission = 0644
  content = templatefile("./inventory.tftpl",
    {
      nodes_private_ip_list  = aws_network_interface.eni[*].private_ip
      iscsi_node_ip          = aws_network_interface.eni-iscsi.private_ip
      nodes_instance_id_list = aws_instance.pcs[*].id
    }
  )
}
