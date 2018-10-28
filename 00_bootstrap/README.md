# 00_setup
This folder contains bootstrap resources for running other examples in this repository

## Resources
Terraform scripts in this folder creates only an S3 bukcet for storing Terraform state

## bootstap.sh
To apply the scripts take those actions:
1. Change `profile` value to you AWS account in `backend_template/backend.tf`
2. Execute `./bootstrap.sh plan`
3. Execute `./bootstrap.sh apply`

NOTICE: `bootstrap.sh` removes `backend.tf` file each time it is being run with `plan` or `apply`.

### `./bootstrap.sh plan`
This command will generate `bootstrap.tfplan` into this directory including terraform plan for creating S3 bucket.

### `./bootstrap.sh apply`
This command will generate apply `bootstrap.tfplan` into your AWS account, copy the `backend_template/backend.tf` into the `00_setup` directory and reinitialize the backend configuration copying local Terraform state into the newly created S3 bucket.