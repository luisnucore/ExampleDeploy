resource "aws_instance" "BitsoEC2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.BitsoPublicSubnet.id}"
  vpc_security_group_ids = "${aws_security_group.BitsoSG.id}"
  user_data = <<-EOF
              #!/bin/bash
              echo "Bitso Challenge || Luis Rios" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "BitsoEC2"
  }
}