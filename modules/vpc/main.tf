# Create VPC 
resource "aws_vpc" "test" {    
    cidr_block = var.cidr
    instance_tenancy = var.instance_tenancy
    enable_dns_hostnames = var.enable_dns_hostnames
    tags = merge (
    {
        "Name" = format("%s", var.name)
    },
    var.tags,
    var.vpc_tags,
    )   
}

# Create public & private subnet
resource "aws_subnet" "public" {
    count = (length(var.public_subnets) > 0) && (length(var.public_subnets) >= length(var.azs)) ? length(var.public_subnets) : 0
    vpc_id = aws_vpc.test.id
    cidr_block = var.public_subnets[count.index]
    #cidr_block = element(concat(var.public_subnets, [""]), count.index)
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = var.map_public_ip_on_launch
    tags = merge(
        {
        # Name = "stagevpc-public-us-east-1-"
        "Name" = format("%s-${var.public_subnet_suffix}-%s", 
        var.name, var.azs[count.index]
        )
        },
        var.public_subnet_tags,
    )   
}

resource aws_subnet "private" {
    count = (length(var.private_subnets) > 0) && (length(var.private_subnets) >= length(var.azs)) ? length(var.private_subnets) : 0
    vpc_id = aws_vpc.test.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = var.map_public_ip_on_launch
    tags = merge(
        {
        # Name = "stagevpc-private-us-east-1-"
        "Name" = format("%s-${var.private_subnet_suffix}-%s",
            var.name, var.azs[count.index]
        ) 
        },
        var.private_subnet_tags,
    ) 
}


# Create internet gateway & attach to the VPC
resource "aws_internet_gateway" "igw" {
    count = (length(var.public_subnets) > 0) ? 1 : 0
    vpc_id = aws_vpc.test.id
    tags = merge(
        {
            "Name" = "${var.name}-igw" 
        },
        var.tags
    )
    depends_on = [ aws_vpc.test ]      
}


####### Public Route ######### 
resource aws_route_table "public" {
    count = (length(var.public_subnets) > 0) ? 1 : 0
    vpc_id = aws_vpc.test.id
    tags = merge(
        {
            "Name" = format("%s-${var.public_subnet_suffix}-%s-rt",
                var.name, var.azs[count.index]
            ) 
        },
        var.tags
    )
}

resource "aws_route" "public-igw" {
  route_table_id = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw[0].id
  depends_on = [ aws_route_table.public[0] ]

}


######## Private Route ############
resource aws_route_table "private" {
    count = (length(var.private_subnets) > 0) ? 1 : 0
    vpc_id = aws_vpc.test.id 
    tags = merge(
        {
            "Name" = format("%s-${var.private_subnet_suffix}-%s-rt",
                var.name, var.azs[count.index]
            )             
        },
        var.tags
    )
}


#### Route table association ####
resource aws_route_table_association "public" {
    count = (length(var.public_subnets) > 0) ? length(var.public_subnets) : 0
    subnet_id = element(aws_subnet.public.*.id, count.index)
    route_table_id = element(aws_route_table.public.*.id, count.index)
}

resource aws_route_table_association "private" {
    count = (length(var.public_subnets) > 0) ? length(var.public_subnets) : 0
    subnet_id = element(aws_subnet.private.*.id, count.index)
    route_table_id = element(aws_route_table.private.*.id, count.index)
}

