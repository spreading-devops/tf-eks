# Terraform EKS Production ready

Terraform AWS Provider version 5.6.2

## AWS required services and resources

### Create S3 buckets and DynamoDB tables to handle terraform backend

```bash
$ cd shared-state
$ vim terraform.tfvars
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Create network AWS Services like VPC, Subnets, Route Tables and Gateway.

```bash
$ cd dev-vpc
$ vim terraform.tfvars
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Create the EKS cluster and Worker Nodes

```bash
$ cd dev
$ vim terraform.tfvars
...
$ terraform init
$ terraform plan
$ terraform apply
```

### Retrieve the cluster kubeconfig file

```bash
#$ aws eks --region $(terraform output aws_region) update-kubeconfig --name $(terraform output cluster_full_name)
$ aws eks --region "us-east-1" update-kubeconfig --name "dev-matheuscarino-default"
#$ terraform output authconfig | kubectl -n kube-system create -f –
$ kubectl -n kube-system create -f autoconfig.yaml
$ kubectl get nodes -o wide
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

###

```bash

```



