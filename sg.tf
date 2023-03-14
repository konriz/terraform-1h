resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "SSH from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.myIP]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_mysql" {
  name        = "allow_mysql"
  description = "Allow MySQL inbound traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "MySQL from Internet"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.myIP]
  }

  tags = {
    Name = "allow_mysql"
  }
}

resource "aws_security_group" "internal" {
  name        = "internal"
  description = "Allow unlimited internal traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "internal"
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "internal"
  }
}

