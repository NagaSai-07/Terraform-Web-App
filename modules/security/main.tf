resource "aws_security_group" "web_sg" {
    name = "${var.project}-web-sg"
    description = "Allow SSH and HTTP"
    vpc_id = var.vpc_id

    ingress = {
        description = "Allow ssh from anywhere"
        from_port = 22
        to_prot = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow http from anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project}-web-sg"
    }
}

resource "aws_key_pair" "web_key" {
    key_name = var.key_name
    public_key = file(var.public_key_path)
}