resource "aws_security_group" "dev-stack-sg" {
  vpc_id      = aws_vpc.dev.id
  name        = "dev-stack-sg"
  description = "Sec Grp for dev ssh"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  tags = {
    Name = "allow-ssh"
  }

}


resource "aws_security_group" "dev-sonar-sg" {
  vpc_id      = aws_vpc.dev.id
  name        = "dev-sonar-sg"
  description = "Sec Grp for dev ssh"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.dev-stack-sg.id]
  }

  tags = {
    Name = "allow-ssh"
  }

}


