output "public_subnets" {
  description = "ID's of the VPC Publi Subnets"
  value = aws_subnet.public.*.id
}