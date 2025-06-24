resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  auto_accept = true
  tags        = { Name = "peering" }
}

resource "aws_route" "vpc1_to_vpc2" {
  route_table_id            = var.vpc1_rt_id
  destination_cidr_block    = var.vpc2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "vpc2_to_vpc1" {
  route_table_id            = var.vpc2_rt_id
  destination_cidr_block    = var.vpc1_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}