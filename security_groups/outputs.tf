output "jenkins_master_sg_id" {
  value = aws_security_group.jenkins_master.id
}
output "jenkins_docker_host_sg_id" {
  value = aws_security_group.jenkins_docker_host.id
}
