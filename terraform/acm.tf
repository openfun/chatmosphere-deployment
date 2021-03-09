# Certificate must be in eu-east-1 region to be used with cloudfront
resource "aws_acm_certificate" "chatmosphere_certificate" {
  provider          = aws.us-east-1
  domain_name       = var.cloudfront_chatmosphere_domain_name
  validation_method = "DNS"

  tags = {
    Environment = terraform.workspace
  }

  lifecycle {
    create_before_destroy = true
  }
}
