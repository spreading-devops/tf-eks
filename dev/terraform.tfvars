aws_region = "us-east-1"
private_subnet_ids = [
  "subnet-054ee8297e86f13f9",
  "subnet-043bb077b2ee79a7e",
  "subnet-04a2febd52e7ad7e3",
]
public_subnet_ids = [
  "subnet-0828ab470a617f8e3",
  "subnet-04ce445317984676a",
  "subnet-0c6a9e3288a51217b",
]
vpc_id = "vpc-0cdb3b50d12c52e2a"
clusters_name_prefix  = "dev-matheuscarino"
cluster_version       = "1.27"
workers_instance_type = "t3.medium"
workers_number_min    = 2
workers_number_max    = 3
workers_storage_size  = 10
