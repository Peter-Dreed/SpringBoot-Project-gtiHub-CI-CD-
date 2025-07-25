resource "aws_instance" "dev" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.public_subnet_id
    key_name                    = aws_key_pair.generated_key.key_name
    vpc_security_group_ids      = [aws_security_group.spring_sg.id]
    associate_public_ip_address = true

    user_data = var.user_data
    
    tags = {
        Name = "Springboot"
        Env  = "dev"
    }
}

resource "aws_security_group" "spring_sg" {
    name        = "springboot_sg"
    description = "Security group for Spring Boot application"
    vpc_id      = var.vpc_id

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
