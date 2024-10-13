output "jenkins_server_public_ip" {
  value = module.ec2_instances.jenkins_server_public_ip
}

output "jenkins_server_public_dns" {
  value = module.ec2_instances.jenkins_server_public_dns
}

output "jenkins_agent_public_ip" {
  value = module.ec2_instances.jenkins_agent_public_ip
}

output "jenkins_agent_public_dns" {
  value = module.ec2_instances.jenkins_agent_public_dns
}
