resource "aws_key_pair" "jenkins_ec2_keypair" {
  public_key = var.public_key
  key_name   = var.key_name
}


resource "aws_instance" "jenkins-master" {
  key_name                    = aws_key_pair.jenkins_ec2_keypair.key_name
  instance_type               = var.jenkins_master_instance_type
  vpc_security_group_ids      = [var.jenkins_master_sg_id]
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }
  user_data = templatefile("./bash_scripts/jenkins_master_init.sh", {})
  tags = {
    Name = var.jenkins_master_name
  }
}

resource "aws_instance" "jenkins_docker_host" {
  key_name                    = aws_key_pair.jenkins_ec2_keypair.key_name
  instance_type               = var.jenkins_docker_host_instance_type
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.jenkins_docker_host_sg_id]
  root_block_device {
    volume_size = 15
  }
  user_data = templatefile("./bash_scripts/jenkins_docker_host_init.sh", {})
  tags = {
    Name = var.jenkins_docker_host_name
  }
}
