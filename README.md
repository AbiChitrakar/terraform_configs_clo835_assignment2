# terraform_configs_clo835_assignment2
Describing Infrastructure for CLO 835 Assignment 2 using terraform.


# Terraform EC2 with Kind Cluster

This repository contains Terraform configurations to automatically provision and configure AWS EC2 instances with [Kind (Kubernetes IN Docker)](https://kind.sigs.k8s.io/) installed on startup.

## Repository
[https://github.com/AbiChitrakar/terraform_configs_clo835_assignment2.git]

## Overview

This project automates the deployment of EC2 instances with Kind pre-installed, allowing you to quickly set up Kubernetes development environments in AWS.



## Prerequisites

- AWS CLI configured with appropriate credentials
- Basic knowledge of AWS and Kubernetes concepts

## Installing Terraform

1. Visit [Terraform's download page](https://www.terraform.io/downloads.html) or install via package manager:

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/AbiChitrakar/terraform_configs_clo835_assignment2.git
   cd terraform_configs_clo835_assignment2
   ```

2. Initialize the Terraform working directory:
   ```bash
   tf init
   ```

3. Format and validate Terraform code:
   ```bash
   tf fmt
   ```

4. Preview the changes:
   ```bash
   tf plan
   ```

5. Apply the Terraform configuration:
   ```bash
   tf apply
   ```

6. When you're done, you can destroy the infrastructure:
   ```bash
   tf destroy
   ```

## Configuration

### Input Variables

You can customize the deployment by modifying the following variables:

- `instance_type`: EC2 instance type (default: updated recently)

### Outputs

- Connection details for your EC2 instance
- Kind cluster information
- See `outputs.tf` for all available outputs


