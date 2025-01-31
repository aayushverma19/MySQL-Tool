output "pub_instance_id" {
  value       = aws_instance.public-instance.id
  description = "id of the public instance "
}
output "pvt_instance1_id" {
  value       = aws_instance.private-instance1.id
  description = "id of the private instance1 "
}
output "pvt_instance2_id" {
  value       = aws_instance.private-instance2.id
  description = "id of the private instance2"
}
output "Bastion_Public_IP" {
  value       = aws_instance.public-instance.public_ip
  description = "Public IP address of the bastion EC2 instance"
}
