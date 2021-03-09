output "certificate_validation_info" {
  value = aws_acm_certificate.chatmosphere_certificate.domain_validation_options
}

output "iam_trusted_signer_access_key_id" {
  value = aws_iam_access_key.chatmosphere_access_key.id
}

output "iam_secret_access_key" {
  value = aws_iam_access_key.chatmosphere_access_key.secret
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.chatmosphere_cloudfront_distribution.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.chatmosphere_cloudfront_distribution.domain_name
}

output "s3_front_file_bucket" {
  value = aws_s3_bucket.chatmosphere_front_files.id
}

