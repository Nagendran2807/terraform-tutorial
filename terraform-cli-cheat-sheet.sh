
# Changes without being prompted to enter yes 
terraform apply --auto-approve 
#You can use auto approve option apply/destroy

### Initialize terraform 
terraform init 

#### Terraform plan & apply ######
# Display the changes that going to be happen when use terraform apply
terraform plan

# Apply all terraform changes
terraform apply

# Apply a specific terraform resource
terraform apply -target=<resource>
Ex: terraform apply -target=aws_instance.webserver

# You can pass either variable (or) variable file in run time terraform plan/apply
terraform plan -var <var-name>=<value>
Ex: terraform plab -var region=ues-west-1

## var file example
terraform apply -var-file=<path_to_vars_file>
Ex:  terraform apply -var-file=./stage.tfvars

##Do not reconcile state file with real world resources
#(Helpful in large complex deployments for saving deployment time)
terraform apply refresh=false

### Define the simultaneous resource 
terraform apply --parallelism=5

## Restore the state in terraform state file with real world resources
terraform refresh 


#### Destroy Commands ########
# Destroy all terraform resources
terraform destroy

# Destroy selective resources
terraform destroy -target=<resource>
Ex: terraform destroy -target=aws_instance.webserver

# Display the changes going to be destroy when use terraform destroy 
#(i.e Dry run for terraform destroy)
terraform plan -destroy

###### Taint & untaint #####
# Mark a resource as tainted and force a destroy/recreate
terraform taint <resource>

# Mark a resource as untainted (i.e taint going to remove if set)
terraform untaint <resource>


############# Debug ##################
# Show current terraform resources
terraform show

# Validate the terraform code
terraform validate

# Show all terraform outputs
terraform output

# Visualize Terraform Dependency Graph (requires graphviz)
terraform graph | dot -Tsvg > graph.svg



# Initialize Terraform backend & download specified 
plugins/modules
terraform init

# Clear out old modules/plugins & re-initialize terraform 
rm -rf ./.terraform/ && terraform init

# Pull modules into your .terraform directory
terraform get -update=true



# Pull the remote state
terraform state pull > terraform.tfstate

# Push local state to remote state (uses file: terraform.tfstate)
terraform state push

# Update local state file against real resources
terraform refresh

# Tell Terraform a resource has been moved into a module
terraform state mv <resource> <module>
i.e. terraform state mv aws_db_instance.cmdb module.mydb

# Import an existing resource into terraform state
# Note that this is different syntax for every resource
terraform import <resource>
i.e. terraform import aws_instance.web1 i-abcd1234


######### Workspaces ###############
# Create a terraform workspace
terraform workspace new <workspace>

# Change to selected workspace 
terraform workspace select <workspace>

# List all terraform workspaces
terraform workspace list

# Show current terraform workspace
terraform workspace show


# terraform auto completion
terraform -install-autocomplete

cat << EOF > ~/.zshrct
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C /usr/local/bin/terraform terraform
EOF

exec zsh

compaudit | xargs chmod g-w
compaudit

ls -ld ~/.zshrc

echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc