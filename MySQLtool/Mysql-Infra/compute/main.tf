#######################################################################
####            compute module (instance)
#######################################################################

resource "aws_instance" "public-instance" {
  ami                         = var.ami_id
  instance_type               = var.pub_ec2_type
  subnet_id                   = var.pub_sub_id
  key_name                    = var.key
  associate_public_ip_address = var.assign_public_IP_pub
  security_groups             = [var.pub_sg]
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.pub_instance
    DB   = var.tag_name_instance
  }
}

resource "aws_instance" "private-instance1" {
  ami                         = var.ami_id
  instance_type               = var.pvt_ec2_type
  subnet_id                   = var.pvt_sub1_id
  key_name                    = var.key
  associate_public_ip_address = var.assign_public_IP_pvt
  security_groups             = [var.pvt_sg]
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.pvt_instance1
    DB   = var.tag_name_ec2
  }
}
resource "aws_instance" "private-instance2" {
  ami                         = var.ami_id
  instance_type               = var.pvt_ec2_type
  subnet_id                   = var.pvt_sub2_id
  key_name                    = var.key
  associate_public_ip_address = var.assign_public_IP_pvt
  security_groups             = [var.pvt_sg]
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.pvt_instance2
    DB   = var.tag_name_ec2
  }
}
