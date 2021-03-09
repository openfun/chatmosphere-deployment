# Create S3 bucket to store frontend files.
resource "aws_s3_bucket" "chatmosphere_front_files" {
  provider         = aws.default
  bucket_prefix    = "${terraform.workspace}-chatmosphere-front-files"
  acl              = "private"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3600
  }

  tags = {
    Name        = "chatmosphere-front-files"
    Environment = terraform.workspace
  }
}
