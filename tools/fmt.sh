#!/bin/bash

# Menu options
echo "Please select an option:"
echo ""
echo "PRE-commit"
echo "1 - Validate all (pre-commit run --all-files)"
echo "2 - Prepare environment (pre-commit install)"
echo "3 - Update environment (pre-commit autoupdate)"
echo ""
echo "TERRAFORM"
echo "4 - Validate terraform/terragrunt (terraform fmt --recursive; terragrunt hclfmt -recursive)"
echo "7 - Generate Terraform docs (terraform-docs markdown .)"
echo ""
echo "ANSIBLE"
echo "5 - Checks YAML syntax and style (yamllint .)"
echo "6 - Checks all playbooks, roles, and tasks (ansible-lint)"
echo ""
echo "DOCS"
echo "7 - Generate Ansible docs (docsible .)"
echo "8 - Generate Terraform docs (terraform-docs markdown .)"

# Read user input
read -p "Enter your choice: " option

# Perform action based on user input
case $option in
  1)
    echo "Running pre-commit validation on all files..."
    pre-commit run --all-files
    ;;
  2)
    echo "Installing pre-commit hooks..."
    pre-commit install
    ;;
  3)
    echo "Updating pre-commit hooks..."
    pre-commit autoupdate
    ;;
  4)
    echo "Validating Terraform/Terragrunt files..."
    terraform fmt --recursive
    terragrunt hcl fmt
    ;;
  5)
    echo "Checking YAML syntax and style..."
    yamllint .
    ;;
  6)
    echo "Checking all playbooks, roles, and tasks..."
    ansible-lint
    ;;
  7)
    echo "Generating Ansible docs with docsible..."
    docsible .
    ;;
  8)
    echo "Generating Terraform docs with terraform-docs..."
    terraform-docs markdown .
    ;;
  8)
    echo "Generating Ansible documentation..."
    docsible .
    ;;
  *)
    echo "Invalid option. Please select a valid choice (1-8)."
    ;;
esac
