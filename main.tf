# Create S3 bucket
resource "aws_s3_bucket" "myBucket" {
  bucket = var.bucketname
}

# Set bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "myBucket" {
  bucket = aws_s3_bucket.myBucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Set public access block for the specific bucket
resource "aws_s3_bucket_public_access_block" "myBucket" {
  bucket                  = aws_s3_bucket.myBucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set ACL for the S3 bucket
resource "aws_s3_bucket_acl" "myBucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.myBucket,
    aws_s3_bucket_public_access_block.myBucket,
  ]

  bucket = aws_s3_bucket.myBucket.id
  acl    = "public-read"
}

# Upload index.html to S3 bucket
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.myBucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Upload error.html to S3 bucket
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.myBucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Upload profile.png to S3 bucket
resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.myBucket.id
  key    = "profile.png"
  source = "profile.png"
  acl    = "public-read"
}

# Upload script.js to S3 bucket
resource "aws_s3_object" "script" {
  bucket       = aws_s3_bucket.myBucket.id
  key          = "script.js"
  source       = "script.js"
  acl          = "public-read"
  content_type = "text/javascript"
}

# Upload style.css to S3 bucket
resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.myBucket.id
  key          = "style.css"
  source       = "style.css"
  acl          = "public-read"
  content_type = "text/css"
}

# Upload Resume to S3 bucket
resource "aws_s3_object" "document" {
  bucket       = aws_s3_bucket.myBucket.id
  key          = "Gaurav_Jambhulkar_Resume.pdf"
  source       = "Gaurav_Jambhulkar_Resume.pdf"
  acl          = "public-read"
  content_type = "application/pdf"
}

# Configure S3 bucket as a website
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.myBucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.myBucket]
}
