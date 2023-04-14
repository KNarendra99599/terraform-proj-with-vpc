resource "aws_key_pair" "dev-key" {
  key_name   = "devkey-02"
  public_key = file(var.PUB_KEY)

}

resource "aws_instance" "dev-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dev-pub-1.id
  key_name               = aws_key_pair.dev-key.key_name
  vpc_security_group_ids = [aws_security_group.dev-stack-sg.id]

  tags = {
    Name = "my-dev"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

  }

  connection {
    user        = var.USER
    private_key = file("devkey-02")
    host        = self.public_ip
  }

}

resource "aws_ebs_volume" "vol-dev" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "vol-dev"
  }
}

resource "aws_volume_attachment" "attach-dev" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol-dev.id
  instance_id = aws_instance.dev-web.id
}

output "PublicIP" {
  value = aws_instance.dev-web.public_ip
}
