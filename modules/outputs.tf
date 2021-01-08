
output "vpc_public_subnets" {
  description = "ID's of the VPC Publi Subnets"
  value = module.vpc.public_subnets
}