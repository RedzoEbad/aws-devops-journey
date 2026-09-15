output "bucket_name" {
description = "this is bucket name"
value = aws_s3_bucket.example.id
}

output "arn" {
value = aws_s3_bucket.example.arn
}