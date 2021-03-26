output "PublicIPs" {
    value = [aws_instance.web.*.public_ip]
}