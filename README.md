# cloudcomp midterm 2023

## Set up terraform in AWS Linux 2

Attach IAM Role with these policies:

- EC2FullAccess
- S3FullAccess
- IAMFullAccess

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
```

## Run terraform

```bash
git clone https://github.com/Pondpdpr/cloud-midterm.git
cd cloud-midterm
cd terraform
terraform init
terraform plan
terraform apply
```
