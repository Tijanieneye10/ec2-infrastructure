# AWS Infrastructure with Terraform

This Terraform code defines an AWS infrastructure configuration to set up a web server with security groups in an Amazon Virtual Private Cloud (VPC).

## Infrastructure Overview

The infrastructure consists of the following components:

- **VPC (Virtual Private Cloud):** The `aws_vpc` data block retrieves the default VPC.

- **Security Group:** The `aws_security_group` resource creates a security group named "webSG" with inbound and outbound rules.

- **Inbound Rule for SSH:** The `aws_security_group_rule` resource allows incoming SSH (port 22) access from a specific IP address (`var.my_ip`).

- **Inbound Rule for HTTP:** The `aws_security_group_rule` resource allows incoming HTTP (port 80) access from any IP address (`0.0.0.0/0`).

- **Outbound Rule for All Traffic:** The `aws_security_group_rule` resource allows all outbound traffic (any protocol, any port) to any IP address (`0.0.0.0/0`).

- **Key Pair:** The `aws_key_pair` resource creates an SSH key pair named "web_server_key" using the public key provided in `var.public_key_location`.

- **EC2 Instance (Web Server):** The `aws_instance` resource launches an EC2 instance with the specified Amazon Machine Image (AMI), instance type, and other configurations. It is associated with the created security group and key pair. The `user_data` field specifies a script (`entrypoint.sh`) to be executed during instance startup.

## Prerequisites

Before running the Terraform code, ensure that you have:

- AWS credentials set up on your local machine or the environment where you are executing Terraform.
- Updated the `variables.tf` file with your specific variable values (e.g., `var.my_ip`, `var.public_key_location`, `var.ami`).

## Usage

1. Initialize Terraform:
   ```shell
   terraform init
2. Review the planned Infrastructure:
   ```shell
   terraform init
3. Deploy the Infrastructure:
   ```shell
   terraform init

## Connect with Me

[![Twitter](https://img.shields.io/badge/Twitter-%40Tijanieneye-blue?style=flat-square&logo=twitter)](https://twitter.com/Tijanieneye)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-@UsmanTijani-blue?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/usman-tijani-eneye/)
