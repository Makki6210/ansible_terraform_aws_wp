output "wp_public_ips" {
  value = [for i in aws_instance.wp_server : i.public_ip]
}