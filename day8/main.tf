resource "aws_s3_bucket" "my_bucket"{
  count = 2
  bucket=var.bucket_names[count.index]
  tags=var.s3_tags
  depends_on = [ aws_s3_bucket.my_bucket_set ]
}


resource "aws_s3_bucket" "my_bucket_set"{
  for_each=(var.bucket_names_set)
  bucket=each.key
  tags=var.s3_tags
}