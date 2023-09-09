resource "aws_network_interface" "eni" {
  count = 3
  #subnet_id = "subnet-738FFC80"
  subnet_id = var.subnet[count.index]

  tags = {
    Name = "primary network interface for eni-${count.index}"
  }
}

resource "aws_instance" "pcs" {
  count         = 3
  ami           = "cmi-5DB160EF"
  instance_type = "c5.large"

  tags = {
    Name = "pcs-${count.index}"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni[count.index].id
    device_index         = 0
  }


  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    tags = {
      "Name" = "Disk for pcs-${count.index}"
    }

  }

  key_name = "AGlumov"

}

resource "aws_ebs_volume" "iscsi_vol" {
  availability_zone = "ru-msk-vol51"
  size              = 32
  type              = "gp2"

  tags = {
    Name = "Disk for Pacemaker cluster"
  }

}

resource "aws_volume_attachment" "iscsi_vol_attach" {
  device_name = "disk2"
  volume_id   = aws_ebs_volume.iscsi_vol.id
  instance_id = aws_instance.iscsi.id
}

resource "aws_network_interface" "eni-iscsi" {
  subnet_id = "subnet-738FFC80"

  tags = {
    Name = "primary network interface for eni-iscsi"
  }
}

resource "aws_instance" "iscsi" {
  ami           = "cmi-5DB160EF"
  instance_type = "c5.large"

  tags = {
    Name = "iscsi target"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni-iscsi.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    tags = {
      "Name" = "Disk for iscsi instance"
    }

  }

  key_name = "AGlumov"

}

