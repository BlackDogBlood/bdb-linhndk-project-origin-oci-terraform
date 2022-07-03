# bdb-linhndk-project-origin-oci-terraform

**Oracle cloud infrastructure:**

## Table of contents

* [General info](#general-info)
* [Compute instances](#compute-instances)
* [Instances responsibilities](#instances-responsibilities)
* [Installation](#installation)
* [Notes](#notes)

## General info

Use always-free and trial services for practicing infrastructures.

## Compute instances

* 2x VM.Standard.E2.1.Micro (1 OCPU + 1 GB RAM each)
* 2x VM.Standard.A1.Flex (2 OCPU + 12 GB RAM each)

## Instances responsibilities

* 2x VM.Standard.E2.1.Micro = 2x k3s master node
* 2x VM.Standard.A1.Flex = 2x k3s worker nodes

## Installation
1. Create `terraform.tfvars` file
2. Set values for `tenancy_ocid`, `user_ocid`, `fingerprint`
3. Run `terraform init`
4. Run` terraform plan` to see the changes
## Notes
