[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://gitlab.com/ai-cicd/api-project)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.1.1-yellow.svg?style=flat-square)](https://conventionalcommits.org)
[![Terraform](https://img.shields.io/badge/terraform-v1.4.5-purple.svg?style=flat-square)](https://github.com/hashicorp/terraform)

# terraform-gitlab-users

This project to provide gitlab access using terraform.

# Development

Installed terraform in local

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

```bash
git remote add terraform-gitlab-users git@github.com:jayantapaul-18/terraform-gitlab-users.git
git clone https://github.com/jayantapaul-18/terraform-gitlab-users.git
cd terraform-gitlab-users
```

# Terraform

Here are the command terraform `init` , `validate`, `plan` & `apply` . which will create the gitlab users & project. In terraform plan the varriable `gitlab_token` need to set with your actual gitlab access token .

```bash
terraform init
terraform validate
terraform plan -var 'gitlab_token=fake-token'
terraform apply
```

## Running pre-commit checks

[pre-commit](https://pre-commit.com) installs git hooks configured in [.pre-commit-config.yaml](.pre-commit-config.yaml)

Install `pre-commit` and `commitizen` to use

```bash
brew install commitizen
brew install pre-commit

pre-commit install
pre-commit install --hook-type commit-msg
pre-commit run --all-files

git add .
git status
pre-commit run --all-files
cz c
git commit -m 'feat: terraform gitlab users'
git push origin main --force
```

# Project Structure

❯ tree
.
├── CHANGELOG.md
├── CODEOWNERS
├── README.md
├── gitlab_users.tf
├── main.tf
├── provider.tf
├── users.json
├── users.txt
└── variables.tf
