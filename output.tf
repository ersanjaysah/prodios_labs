output "vpc-id" {
  value = aws_vpc.custom_VPC.id
}

output "igw-id" {
  value = aws_internet_gateway.custom_IGW.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "route_table_id" {
  value = aws_route_table.custom_route_table.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "epi_Allocation_ID" {
  value = aws_eip.custom_EPI.allocation_id
}

output "nat_GW_ID" {
  value = aws_nat_gateway.custom_NAT_GW.id
}

output "pvt_rT_id" {
  value = aws_route_table.private_route_table.id
}

output "data_Persist" {
  value = data.aws_ami.ubuntu.id
}