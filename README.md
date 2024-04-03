# Project Deployment Infrastructure Setup

This repository https://github.com/ersanjaysah/prodios_labs.git contains Terraform code to set up a full AWS infrastructure for deploying Assignment. 

The infrastructure includes the following components:-

- *VPC Setup*: Creates a custom Virtual Private Cloud (VPC) with specified CIDR block and enables DNS hostname i.e www.prodioslabs.com resolution. Defines subnets (public and private) within the custom VPC with appropriate CIDR blocks. Configures route tables and associations for routing traffic between subnets.

- *S3 Bucket*: Creates an S3 bucket with a unique name for storing static files or other resources and also Configures bucket policies so that user can only put object and get object.

- *IAM Role*: Defines an IAM role with specific permissions required for accessing AWS resources or services. Attaches policies to the role to grant necessary permissions for EC2 instances or other entities within the infrastructure.

- *Load Balancing*: Sets up an Application Load Balancer (ALB) to distribute incoming traffic across multiple EC2 instances. Configures listeners, target groups, health checks, and security settings for the load balancer.

- *Auto Scaling Group (ASG)*: Creates an Auto Scaling Group to automatically scale the number of EC2 instances based on demand. Defines launch configurations with instance types, AMI IDs, security groups, and other specifications. Sets up scaling policies to adjust the number of instances in response to metrics like CPU utilization or request count.

- *Roure53 For Domain Name* : Sets up a CNAME record in Amazon Route 53 to point to prodioslabs.com to a load balancer. The aws_route53_record resource specifies the zone ID of the hosted zone, the domain name (www.prodioslabs.com), record type (CNAME), Time to Live (TTL), and the DNS name of the load balancer to which traffic should be directed. 

## Prerequisites

Before getting started, make sure you have the following prerequisites installed:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with appropriate access credentials

## Usage

1. Clone this repository to your local machine:

    bash
    git clone https://github.com/ersanjaysah/prodios_labs.git
    

2. Navigate to the project directory:

    bash
    ls (for listing the files or directory)
    cd prodios_labs
    

3. Initialize Terraform:

    bash
    terraform init
    

4. Review and customize the terraform.tfvars file to set your desired configuration parameters.

5. Apply the Terraform configuration to create the infrastructure:

    bash
    terraform apply
    

6. Confirm the changes and enter yes when prompted.

7. Once the infrastructure is created, you will see the outputs containing relevant information such as the URLs for accessing your application, etc.

## Cleanup the resources

To destroy the infrastructure and clean up resources:

1. Navigate to the project directory if not already there:

    bash
    cd prodios_labs
    

2. Run the following command:

    bash
    terraform destroy
    

3. Confirm the action by entering yes when prompted.

## Important Notes

- Ensure that you have proper access permissions to create and manage AWS resources specified in the Terraform configuration.
- Review and customize the Terraform configuration files according to your project requirements before applying them.

## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

---

Feel free to further customize this README file based on additional details or instructions specific to your project or infrastructure setup.
