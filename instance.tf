resource "aws_key_pair" "projectkey" {
  key_name   = "projectkey"
  public_key = file("projectkey.pub")
}

resource "aws_instance" "webtemplate" {
  count = 5
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
      "sudo apt update",
      "sudo apt upgrade",
    ]
  }

  connection {
    user        = var.USER
    private_key = file("projectkey")
    host        = self.public_ip
  }
}

resource "null_resource" "save_output" {
  depends_on = [aws_instance.webtemplate]

  provisioner "local-exec" {
    command = <<-EOT
        echo '${aws_instance.webtemplate.public_ip}' >> output.txt
      EOT
  }
}

output "PublicIP" {
  value = aws_instance.webtemplate.public_ip
}
