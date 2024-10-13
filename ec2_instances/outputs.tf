output "jenkins_server_public_dns" {
  value = aws_instance.jenkins-master.public_dns
}

output "jenkins_server_public_ip" {
  value = aws_instance.jenkins-master.public_ip
}

output "jenkins_agent_public_dns" {
  value = aws_instance.jenkins_docker_host.public_dns
}

output "jenkins_agent_public_ip" {
  value = aws_instance.jenkins_docker_host.public_ip
}
