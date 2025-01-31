#######################################################################
####            security module (security group)
#######################################################################

resource "aws_security_group" "public_sgroups" {
  name   = var.pub_sg_name
  vpc_id = var.VPC_ID  

  dynamic "ingress" {
    for_each = var.public_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.public_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = {
    Name = var.pub_sg_tag
  }
}

resource "aws_security_group" "private_sg" {
  name   = var.pvt_sg_name
  vpc_id = var.VPC_ID  

  dynamic "ingress" {
    for_each = var.private_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.private_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = {
    Name = var.pvt_sg_tag
  }
}


#######################################################################
####            Nacl
#######################################################################

resource "aws_network_acl" "naclpvt" {
  vpc_id = var.VPC_ID  

  # Ingress rule using the variable
dynamic "ingress" {
    for_each = var.ingress_rule_nacl
    content {
    protocol   = ingress.value.protocol
    rule_no    = ingress.value.rule_no
    action     = ingress.value.action
    cidr_block = ingress.value.cidr_block
    from_port  = ingress.value.from_port
    to_port    = ingress.value.to_port
  }
}

    # Egress rule using the variable
  dynamic "egress" {
    for_each = var.egress_rule_nacl
    content {
    protocol   = egress.value.protocol
    rule_no    = egress.value.rule_no
    action     = egress.value.action
    cidr_block = egress.value.cidr_block
    from_port  = egress.value.from_port
    to_port    = egress.value.to_port
  }
  }

  tags = {
    Name = var.tag_nacl
  }
}

###### nacl association pvt1
resource "aws_network_acl_association" "pvt1" {
  network_acl_id = aws_network_acl.naclpvt.id
  subnet_id      = var.pvt_sub1_id
}

###### nacl association pvt2
resource "aws_network_acl_association" "pv2" {
  network_acl_id = aws_network_acl.naclpvt.id
  subnet_id      = var.pvt_sub2_id
}
