output "siva" {
  value = zipmap(aws_instance.dev[*].public_ip, aws_instance.dev[*].Private_ip)
}
