output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "key_pair_name" {
  value = aws_key_pair.web_key.key_name
}
