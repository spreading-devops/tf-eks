resource "aws_s3_bucket" "clusters_tf_state_s3_bucket" {
  bucket = "${var.clusters_name_prefix}-terraform-state"
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name      = "${var.clusters_name_prefix} S3 bucket to store remote Terraform State"
    ManagedBy = "terraform"
  }
}

resource "aws_s3_bucket_ownership_controls" "clusters_tf_state_s3_bucket_owner" {
  bucket = aws_s3_bucket.clusters_tf_state_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "clusters_tf_state_s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.clusters_tf_state_s3_bucket_owner]
  bucket = aws_s3_bucket.clusters_tf_state_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "clusters_tf_state_s3_bucket_versioning" {
  bucket = aws_s3_bucket.clusters_tf_state_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#######################

resource "aws_s3_bucket" "clusters_vpc_tf_state_s3_bucket" {
  bucket = "${var.clusters_name_prefix}-vpc-terraform-state"
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name      = "${var.clusters_name_prefix} S3 bucket to store remote Terraform State"
    ManagedBy = "terraform"
  }
}

resource "aws_s3_bucket_ownership_controls" "clusters_vpc_tf_state_s3_bucket_owner" {
  bucket = aws_s3_bucket.clusters_vpc_tf_state_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "clusters_vpc_tf_state_s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.clusters_vpc_tf_state_s3_bucket_owner]
  bucket = aws_s3_bucket.clusters_tf_state_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "clusters_vpc_tf_state_s3_bucket_versioning" {
  bucket = aws_s3_bucket.clusters_vpc_tf_state_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}