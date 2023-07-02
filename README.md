# Terraform EKS Production ready

Terraform AWS Provider version 5.6.2

## AWS required services and resources

### Create S3 buckets and DynamoDB tables to handle terraform backend

```bash
$ cd shared-state
$ vim terraform.tfvars # CONFIGURE
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Create network AWS Services like VPC, Subnets, Route Tables and Gateway.

```bash
$ cd dev-vpc
$ vim terraform.tfvars # CONFIGURE
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Create the EKS cluster and Worker Nodes

```bash
$ cd dev
$ vim terraform.tfvars # CONFIGURE THE VPC-ID AND PUBLIC/PRIVATE SUBNETS
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Retrieve the cluster kubeconfig file

```bash
## Get kubeconfig from AWS EKS cluster created
#$ aws eks --region $(terraform output aws_region) update-kubeconfig --name $(terraform output cluster_full_name)
$ aws eks --region "us-east-1" update-kubeconfig --name "dev-matheuscarino-default"
## Retrieve authconfig and Copy his content
$ terraform output authconfig
## Create autoconfig.yaml and Put the output from last command inside
$ vim autoconfig.yaml
## Create the needed ConfigMap with this file
$ kubectl -n kube-system create -f autoconfig.yaml
## Checkout your Worker Nodes
$ kubectl get nodes -o wide
```

## Destroy EKS cluster

```bash
$ cd dev
$ terraform destroy --auto-approve
$ cd ../dev-vpc/
$ terraform destroy --auto-approve
$ cd ../shared-state
$ aws s3 rm s3://dev-matheuscarino-terraform-state --recursive
$ aws s3 rm s3://dev-matheuscarino-vpc-terraform-state --recursive
$ aws s3 rb s3://dev-matheuscarino-terraform-state --force
$ aws s3 rb s3://dev-matheuscarino-vpc-terraform-state --force
$ terraform destroy --auto-approve
```

###

```bash

```

###

```bash

```

###

```bash

```

###

```bash

```



