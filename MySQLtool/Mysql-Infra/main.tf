module "Netwoking" {
  source           = "./networking"
  vpc_name         = var.vpc_name
  vpc_cidr         = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  dns_support      = var.dns_support
  dns_hostnames    = var.dns_hostnames
  pub_sub_name     = var.pub_sub_name
  pub_sub_cidr     = var.pub_sub_cidr
  az01             = var.availability_zone01
  pvt_sub_name1    = var.pvt_sub_name1
  pvt_sub1_cidr    = var.pvt_sub1_cidr
  pvt_sub_name2    = var.pvt_sub_name2
  pvt_sub2_cidr    = var.pvt_sub2_cidr
  az02             = var.availability_zone02
  igw_name         = var.igw_name
  NAT_name         = var.NAT_name
  local_gateway    = var.local_gateway
  RT-cidr_block    = var.RT_cidr_block
  public_RT_name   = var.public_RT_name
  private_RT_name  = var.private_RT_name
  vpc_accept       = var.vpc_accept
}

module "Security" {
  source                = "./security"
  public_ingress_rules  = var.public_ingress_rules
  public_egress_rules   = var.public_egress_rules
  pub_sg_name           = var.pub_sg_name
  pub_sg_tag            = var.pub_sg_tag
  private_ingress_rules = var.private_ingress_rules
  private_egress_rules  = var.private_egress_rules
  pvt_sg_name           = var.pvt_sg_name
  pvt_sg_tag            = var.pvt_sg_tag
  egress_rule_nacl      = var.egress_rule_nacl
  ingress_rule_nacl     = var.ingress_rule_nacl
  VPC_ID                = module.Netwoking.vpc_id
  pvt_sub1_id           = module.Netwoking.pvt_subnet1_id
  pvt_sub2_id           = module.Netwoking.pvt_subnet2_id
}

module "Compute" {
  source                   = "./compute"
  pub_instance             = var.pub_instance
  tag_name_ec2             = var.tag_name_ec2
  pvt_instance1            = var.pvt_instance1
  pvt_instance2            = var.pvt_instance2
  ami_id                   = var.ami_id
  key                      = var.pem_key
  pub_ec2_type             = var.pub_ec2_type
  pvt_ec2_type             = var.pvt_ec2_type
  assign_public_IP_pub     = var.assign_public_IP_pub
  assign_public_IP_pvt     = var.assign_public_IP_pvt
  volume_size              = var.volume_size
  # tg_name                  = var.tg_name
  # tg_port                  = var.tg_port
  # tg_protocol              = var.tg_protocol
  # health_check_path        = var.health_check_path
  # health_check_interval    = var.health_check_interval
  # health_check_timeout     = var.health_check_timeout
  # health_check_threshold   = var.health_check_threshold
  # unhealth_check_threshold = var.unhealth_check_threshold
  # health_check_matcher     = var.health_check_matcher
  # tg_attachment_port       = var.tg_attachment_port
  # lb_name                  = var.lb_name
  # lb_internal              = var.lb_internal
  # lb_tpye                  = var.lb_tpye
  # lb_enable_deletion       = var.lb_enable_deletion
  # alb_listener_port        = var.alb_listener_port
  # alb_listener_protocol    = var.alb_listener_protocol
  # alb_listener_action      = var.alb_listener_action
  # enable_deletion          = var.enable_deletion
  VPC_ID                   = module.Netwoking.vpc_id
  pub_sub_id               = module.Netwoking.pub_subnet_id
  pvt_sub1_id              = module.Netwoking.pvt_subnet1_id
  pvt_sub2_id              = module.Netwoking.pvt_subnet2_id
  pub_sg                   = module.Security.pub_SG_id
  pvt_sg                   = module.Security.pvt_SG_id
}
