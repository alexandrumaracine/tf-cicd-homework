📘 README — Terraform + GitHub Actions CI/CD Homework

This project demonstrates the fundamentals of Infrastructure as Code (IaC) using Terraform, combined with a full CI/CD pipeline built with GitHub Actions.
The setup uses local-only infrastructure (null provider + local backend) so the entire workflow runs without cloud credentials, but the processes and pipelines fully reflect real-world DevOps practices.

🚀 1. Project Overview

The goal of the homework was to:

Terraform Portion

Create a best-practice Terraform folder structure

Build a VM resource (simulated using the null_resource)

Use local and remote backenasdadasdadadads

Detect infrastructure drift

Create multiple VMs using count and for_each

Wrap infrastructure into a reusable module

Understand why modules are important

CI/CD Portion (GitHub Actions)

Run Terraform checks on every Pull Request

Automatically apply Terraform changes when PRs are merged to main

Enable a manual “Destroy Infrastructure” workflow

Enforce good practices (formatting, validation, planning before merging)

This repository represents a complete mini-pipeline used in professional DevOps workflows.

📁 2. Repository Structure
terraform/
  main.tf
  variables.tf
  outputs.tf
  providers.tf
  versions.tf
  modules/
    vm/
      main.tf
      variables.tf
      outputs.tf

.github/
  workflows/
    terraform-pr.yml
    terraform-apply.yml
    terraform-destroy.yml

tfstate-remote/
  terraform.tfstate   (after backend migration)

🧱 3. Terraform Implementation
✔ 3.1 Best-Practice Folder Structure

Terraform code is split into:

Root module → orchestrates infrastructure

Child module (modules/vm/) → defines how a VM resource is created

Separation of concerns → configuration is clean, maintainable, and professional

✔ 3.2 VM Creation (Simulated with null_resource)

Since the goal is CI/CD, not cloud provisioning, the project uses:

resource "null_resource" "this" { ... }


This lets Terraform create/destroy a placeholder resource while still learning the IaC principles:

plans

applies

detroys

state handling

drift detection

✔ 3.3 Local State Apply/Destroy

Commands:

terraform init
terraform apply -auto-approve
terraform destroy -auto-approve


This shows the full Terraform lifecycle.

✔ 3.4 Remote Backend Configuration (Local Simulation)

Instead of Azure Storage, we use a local backend folder:

backend "local" {
  path = "../tfstate-remote/terraform.tfstate"
}


This simulates:

state migration

team-shared backend configuration

non-local state storage

Terraform even prompts:

“Do you want to migrate the state?”

This confirms real backend behavior.

✔ 3.5 Drift Detection

We manually edited the state file to simulate someone changing infrastructure outside Terraform.

Result:

~ triggers: name = “changed-outside-terraform” -> “test-vm”


Terraform correctly detected drift and proposed to fix it — a critical IaC concept.

✔ 3.6 Creating Multiple VMs
Using count
count = 3
name  = "vm-${count.index}"


Creates:

vm-0

vm-1

vm-2

Using for_each
for_each = local.vm_names
name     = each.value


Creates stable, named resources:

vm-one

vm-two

vm-three

Difference:
Feature	count	for_each
Identity	index-based	name-based
Stability	can change	stable
Use case	identical items	uniquely identified items
✔ 3.7 Using Modules

VM logic is isolated inside /modules/vm.

Benefits:

Reusable across environments

Cleaner root code

Simplified maintenance

Avoids duplication

Professional Terraform structure

⚙️ 4. GitHub Actions CI/CD Workflows

Located in .github/workflows/.

✔ 4.1 PR Validation Workflow (terraform-pr.yml)

Runs on every pull request targeting main.

Steps:

terraform fmt -check

terraform init

terraform validate

terraform plan

Purpose:

Prevent broken Terraform from reaching main

Enforces quality and formatting

Standard DevOps practice

✔ 4.2 Auto Apply Workflow (terraform-apply.yml)

Runs automatically on:

push → main


Does:

init

plan

apply

Even though no real VM is created, the pipeline logic is complete and correct.

✔ 4.3 Manual Destroy Workflow (terraform-destroy.yml)

Triggered through:

workflow_dispatch


Runs:

init

destroy

Useful for cleanup and demonstrates proper pipeline actions.

📜 5. Commands Cheat Sheet
Initialize Terraform
terraform init

Validate formatting
terraform fmt -check

Preview changes
terraform plan

Apply changes
terraform apply -auto-approve

Destroy infrastructure
terraform destroy -auto-approve

🧠 6. Layman's Explanation — How This All Works

Imagine Terraform as an instruction manual for building things.
Instead of building furniture, it builds infrastructure.

GitHub Actions is the robot worker that executes tasks every time code changes.

When you make a Pull Request:

The robot checks:

“Is the manual formatted correctly?”

“Is the manual valid?”

“What would the building look like if we follow this manual?”

If anything is wrong → PR fails → no merging.

When you merge to main:

The robot runs the instructions and builds the infrastructure.

When you click the destroy button:

The robot tears everything down safely.

🎤 7. Presentation Flow (Use This When You Present)
Slide 1 — Goals

Use Terraform to define infrastructure as code

Use GitHub Actions to automate validation, deployment, and destruction

Slide 2 — Terraform Structure

Show folder structure

Explain modules

Explain variables & outputs

Slide 3 — Creating Infrastructure

Simulated VM using null_resource

Why simulation is enough for CI/CD learning

Apply & destroy lifecycle

Slide 4 — Backend & State

Local backend simulation

State migration

Why remote state is important in teams

Slide 5 — Drift Detection

Explain modifying state

Terraform detects differences

Why drift detection prevents configuration drift

Slide 6 — count vs for_each

Show difference

Why for_each is more stable

Slide 7 — Modules

Cleaner code

Reusability

Production-grade IaC structure

Slide 8 — CI/CD Overview

PR workflow: fmt, init, validate, plan

Main workflow: apply

Destroy workflow: manual cleanup

Slide 9 — Benefits

Automation

Reliability

Consistency

Reproducibility

Slide 10 — Summary

“We built a fully automated IaC pipeline using Terraform and GitHub Actions, demonstrating core DevOps principles end-to-end.”