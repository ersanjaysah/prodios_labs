

# Create a hosted zone for your domain
resource "aws_route53_zone" "mydns" {
  name = "www.prodioslabs.com"  # Replace with your domain name
}


# To add a CNAME record for www.example.com
resource "aws_route53_record" "www_record" {
  zone_id = aws_route53_zone.mydns.zone_id
  name    = "www.prodioslabs.com"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.my_load_balancer.dns_name]
}
