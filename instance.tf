resource "aws_key_pair" "projectkey" {
  key_name   = "projectkey"
  public_key = file("projectkey.pub")
}

resource "aws_instance" "servers" {
  count                  = 5
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.treten-pub-1.id
  key_name               = aws_key_pair.projectkey.key_name
  vpc_security_group_ids = [aws_security_group.treten-sg.id]
  tags = {
    Name = "node${count.index + 1}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt upgrade -y",
    ]
  }

  connection {
    type = "ssh"
    user        = var.USER
    private_key = file("projectkey")
    host        = self.public_ip
  }
}

resource "null_resource" "save_output" {
  count = length(aws_instance.servers)

  triggers = {
    instance_id = aws_instance.servers[count.index].id
  }

  provisioner "local-exec" {
    command = "echo '${aws_instance.servers[count.index].public_ip}' >> output.txt"
  }
}


output "PublicIP" {
  value = [for instance in aws_instance.servers : instance.public_ip]
}