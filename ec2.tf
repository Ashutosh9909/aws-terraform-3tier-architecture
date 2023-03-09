# Creating EC2 Web Server
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "aws"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "Web-${count.index + 1}"
  }
}

# Creating EC2 DB Server
resource "aws_instance" "db" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "aws"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB"
  }
}
