# public
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pub-rt"
  }
}

resource "aws_route_table_association" "pub_rt_sub_a" {
  subnet_id      = aws_subnet.pub_a.id
  route_table_id = aws_route_table.pub_rt.id
}
resource "aws_route_table_association" "pub_rt_sub_c" {
  subnet_id      = aws_subnet.pub_c.id
  route_table_id = aws_route_table.pub_rt.id
}

# private
resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "pri-rt"
  }
}

resource "aws_route_table_association" "pri_rt_sub_a" {
  subnet_id      = aws_subnet.pri_a.id
  route_table_id = aws_route_table.pri_rt.id
}
resource "aws_route_table_association" "pri_rt_sub_c" {
  subnet_id      = aws_subnet.pri_c.id
  route_table_id = aws_route_table.pri_rt.id
}

# db
resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "db-rt"
  }
}

resource "aws_route_table_association" "db_rt_sub_a" {
  subnet_id      = aws_subnet.db_a.id
  route_table_id = aws_route_table.db_rt.id
}
resource "aws_route_table_association" "db_rt_sub_c" {
  subnet_id      = aws_subnet.db_c.id
  route_table_id = aws_route_table.db_rt.id
}