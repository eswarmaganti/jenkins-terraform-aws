module "security_groups" {
  source                      = "./security_groups"
  jenkins_master_sg_name      = "jenkins-master-security-group"
  jenkins_docker_host_sg_name = "jenkins-docker-host-security-group"

}
module "ec2_instances" {
  source                            = "./ec2_instances"
  jenkins_master_name               = "jenkins-master-server"
  jenkins_docker_host_name          = "jenkins-docker-host-server"
  key_name                          = "jenkins_ec2"
  public_key                        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH9vGqpQqzoWCqDzmom6jwSKC/5575YxHdGlPsmU1PaP eswarmaganti@Eswars-MacBook-Air.local"
  jenkins_master_instance_type      = "t2.medium"
  jenkins_docker_host_instance_type = "t2.micro"
  jenkins_docker_host_sg_id         = module.security_groups.jenkins_docker_host_sg_id
  jenkins_master_sg_id              = module.security_groups.jenkins_master_sg_id
  ubuntu_ami_id                     = "ami-0b8b44ec9a8f90422"
  depends_on                        = [module.security_groups]
}
