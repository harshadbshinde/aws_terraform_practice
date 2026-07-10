resource "aws_instance" "my_ec2" {
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "t2.micro"
  key_name               = "new"   

  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "ec2"
  }
}

