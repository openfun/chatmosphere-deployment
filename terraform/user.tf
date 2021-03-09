# Define a user and associate appropriate policies
resource "aws_iam_user" "chatmosphere_user" {
  provider  = aws.default
  name      = "${terraform.workspace}-chatmosphere"
}

resource "aws_iam_access_key" "chatmosphere_access_key" {
  provider  = aws.default
  user      = aws_iam_user.chatmosphere_user.name
}

# Grant user access to the front files bucket
resource "aws_s3_bucket_policy" "chatmosphere_front_files_bucket_policy" {
  provider  = aws.default
  bucket    = aws_s3_bucket.chatmosphere_front_files.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "User access",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_user.chatmosphere_user.arn}"
      },
      "Action": [ 
        "s3:DeleteObject",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.chatmosphere_front_files.arn}",
        "${aws_s3_bucket.chatmosphere_front_files.arn}/*"
      ]
    },
    {
      "Sid": "Cloudfront",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_cloudfront_origin_access_identity.chatmosphere_oai.iam_arn}"
      },
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.chatmosphere_front_files.arn}/*"
    }
  ]
}
POLICY
}

# Grant user to invalidate cloudfront cache
resource "aws_iam_user_policy" "invalidate_cloudfront_cache_policy" {
  name = "${terraform.workspace}-chatmosphere-invalidate-cloudfront-cache-policy"
  user = aws_iam_user.chatmosphere_user.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Cloudfront",
      "Effect": "Allow",
      "Action": "cloudfront:CreateInvalidation",
      "Resource": "${aws_cloudfront_distribution.chatmosphere_cloudfront_distribution.arn}"
    }
  ]
}
POLICY
}
