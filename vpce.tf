resource "aws_vpc_endpoint" "dynamodb_vpc_endpoint" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.dynamodb"
}

resource "aws_vpc_endpoint_route_table_association" "dynamodb_route_table_association" {
  route_table_id  = module.vpc.default_route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb_vpc_endpoint.id
}
