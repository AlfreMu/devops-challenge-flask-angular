output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.app.public_ip
}

output "ssh_command" {
  description = "Comando SSH sugerido"
  value       = "ssh -i devops-challenge-sa.pem ubuntu@${aws_instance.app.public_ip}"
}
