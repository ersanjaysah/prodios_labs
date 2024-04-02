# resource "aws_s3_bucket" "upload_file" {
#   bucket = "prodios-labs-upload-bucket-0001"
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": ["s3:GetObject", "s3:PutObject"],
#       "Resource": "arn:aws:s3:::prodios-labs-upload-bucket-0001/*"
#     }
#   ]
# }
# EOF
# }

# resource "aws_s3_bucket_object" "example_object" {
#   bucket = aws_s3_bucket.upload_file.id
#   key    = "index.html"
#   source = "F:/Prodios_Assignment/prodios_labs/index.html"
# }

# # Create a CloudFront distribution
# resource "aws_cloudfront_distribution" "web_cdn" {
#   origin {
#     domain_name = aws_s3_bucket.upload_file.bucket_regional_domain_name
#     origin_id   = "S3-${aws_s3_bucket.upload_file.id}"
#   }

#   enabled             = true
#   is_ipv6_enabled     = false
#   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "S3-${aws_s3_bucket.upload_file.id}"

#     forwarded_values {
#       query_string = true
#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 200
#     max_ttl                = 1000
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true # Used the CloudFront default certificate
#   }
# }