data "aws_vpc" "default" {
    default = true
}

resource "aws_security_group" "web_sg" {
    name = "webSG"
    vpc_id = data.aws_vpc.default.id
    tags = {
      Name = "webSG"
    }
}

resource "aws_security_group_rule" "allow_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    cidr_blocks = [var.my_ip]
    protocol = "tcp"
    security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "allow_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "allow_all" {
    type = "egress"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    security_group_id = aws_security_group.web_sg.id
}

resource "aws_key_pair" "web_server_key" {
    key_name = "web_server_key"
    public_key = file(var.public_key_location)
}

resource "aws_instance" "web_server" {
    ami = var.ami
    instance_type = "t2.small"
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    key_name = aws_key_pair.web_server_key.key_name
    user_data = file("entrypoint.sh")
}
