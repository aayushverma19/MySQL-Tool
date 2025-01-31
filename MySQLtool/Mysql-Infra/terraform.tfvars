# Networking Variables
region_name         = "eu-north-1"
vpc_name            = "MySQL-VPC"
vpc_cidr            = "10.0.0.0/21"
dns_support         = true
dns_hostnames       = true
pub_sub_name        = "public-subnet"
pub_sub_cidr        = "10.0.1.0/24"
availability_zone01 = "eu-north-1a"
pvt_sub_name1       = "private-subnet-1"
pvt_sub1_cidr       = "10.0.2.0/24"
pvt_sub_name2       = "private-subnet-2"
pvt_sub2_cidr       = "10.0.3.0/24"
availability_zone02 = "eu-north-1b"
vpc_accept          = true

# Security Variables
public_ingress_rules = [
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "SSH" },
  { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "MySQL" },
  { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "All Inbound" }
]
public_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "All Outbound" }
]
pub_sg_name = "public_sg"
pub_sg_tag  = "public_Sgroup"

private_ingress_rules = [
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.1.0/24"], description = "SSH" },
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["172.31.0.0/16"], description = "SSH for vpc Peering CIDR" },
  { from_port = 3306, to_port = 3306, protocol = "tcp", cidr_blocks = ["10.0.1.0/24"], description = "MySQL" },
]
private_egress_rules = [
  { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "All Inbound" }
]
pvt_sg_name = "private_sg"
pvt_sg_tag  = "private_Sgroup"

egress_rule_nacl = [
  {
    protocol   = "all" #tcp
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]
ingress_rule_nacl = [
  {
    protocol   = "all" #tcp
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
]

# Compute Variables
pub_instance         = "Bastion_host"
tag_name_ec2         = "mysql"
pvt_instance1        = "Database-server1"
pvt_instance2        = "Database-server2"
ami_id               = "ami-075449515af5df0d1"
pem_key              = "mysql"
pub_ec2_type         = "t3.micro" # use for eu-north-1
pvt_ec2_type         = "t3.micro"
assign_public_IP_pub = true
assign_public_IP_pvt = false
volume_size          = 29
pem_source_path      = "/home/ubuntu/mysql.pem"
pem_destination_path = "/home/ubuntu/mysql.pem"
