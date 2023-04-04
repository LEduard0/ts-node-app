tf-init:
	@echo "Initializing Terraform"
	terraform init -upgrade

# make tf-plan TF-VAR-ENV="qa"

tf-plan:
	@echo "Initializing plan with ${TF-VAR-ENV} variables"
	terraform plan -var-file="${TF-VAR-ENV}/${TF-VAR-ENV}.tfvars"

# make tf-apply TF-VAR-ENV="qa"

tf-apply:
	@echo "Initializing apply with ${TF-VAR-ENV} variables"
	terraform apply -var-file="${TF-VAR-ENV}/${TF-VAR-ENV}.tfvars"

# make tf-destroy TF-VAR-ENV="qa"

tf-destroy:
	@echo "Initializing destroy with ${TF-VAR-ENV} variables"
	terraform destroy -var-file="${TF-VAR-ENV}/${TF-VAR-ENV}.tfvars"