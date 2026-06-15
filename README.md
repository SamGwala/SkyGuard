# SkyGuard

## Cloud-Native Infrastructure Resilience and Incident Response Platform

SkyGuard is an AWS-based infrastructure resilience project designed to move beyond simple failure detection.

The goal of this project is to build a platform that can eventually detect failures, classify incidents, decide on the correct recovery action, escalate when automation is not enough, and support infrastructure recovery using AWS services.

SkyGuard is being built as a practical cloud engineering project using Terraform and AWS.

---

## Why This Project Exists

My previous project focused on one question:

**Can infrastructure detect a failure and recover automatically?**

SkyGuard explores the next question:

**Can infrastructure make better recovery decisions based on the type of failure and its history?**

Instead of treating every incident the same way, SkyGuard is designed to become a decision-based incident response platform.

---

## Current Progress

### Completed

* Project repository structure
* Terraform environment structure
* VPC module
* Public subnet
* Internet Gateway
* Route table
* Route table association
* Terraform variables and outputs

### Current Phase

Networking foundation.

The first version of SkyGuard currently provisions the basic network layer required for future compute, monitoring, and incident response components.


## Architecture So Far

```text
VPC
│
├── Public Subnet
│
├── Internet Gateway
│
├── Route Table
│
└── Route Table Association
```

The networking layer is written as a reusable Terraform module.

## Terraform Structure

```text
terraform/
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── providers.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── iam/
    └── ec2/
```

## Terraform Design Lesson

This project follows the pattern:

```text
modules = HOW
environments = WHAT
```

The VPC module defines how to build the network.
The dev environment defines what values to use such as:

* VPC CIDR block
* Public subnet CIDR block
* Environment name
* Project name
* Owner

This keeps the module reusable across future environments like dev, test, and production.

## Planned AWS Stack
* Terraform
* AWS VPC
* EC2
* IAM
* Systems Manager
* CloudWatch
* EventBridge
* Lambda
* DynamoDB
* SNS
* Grafana

## Planned Recovery Strategy

SkyGuard will eventually support three recovery layers:

### Layer 1: SSM Runbooks

Used for lightweight recovery such as restarting services or clearing temporary issues.

### Layer 2: Infrastructure Replacement

Used when an instance becomes unhealthy and needs to be replaced.

### Layer 3: Environment Reconstruction

Used when recovery is no longer enough and infrastructure needs to be rebuilt from code.

## Upcoming Work

Next steps:
* Build IAM module
* Create EC2 instance module
* Attach IAM instance profile
* Deploy SkyGuard-Node-01
* Install and configure CloudWatch Agent
* Create monitoring alarms
* Add EventBridge and Lambda-based incident processing

## Status

Project status: Active development
Current milestone: Networking foundation complete
