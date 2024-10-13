resource "aws_security_group" "jenkins_master" {
  name        = var.jenkins_master_sg_name
  description = "Security group for jenkins master which allows SSH and TCP on port 8080"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow instance to access the public internet"
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PORT 8080 to access from public internet"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PORT 22 to access from public internet"
  }
}


resource "aws_security_group" "jenkins_docker_host" {
  name        = var.jenkins_docker_host_sg_name
  description = "Security group for jenkins docker host for agents"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow instance to access the public internet"
  }

  ingress {
    from_port   = 4243
    to_port     = 4243
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PORT 8080 to access from public internet"
  }
  ingress {
    from_port   = 32768
    to_port     = 60999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PORT 32768-60999 to access from public internet for docker agents"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow PORT 22 to access from public internet"
  }
}
