output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.app.public_ip
}

output "ssh_command" {
  description = "Comando SSH sugerido"
  value       = "ssh -i TU_PEM ubuntu@${aws_instance.app.public_ip}"
}
