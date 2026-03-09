# EC2 and VPC Infrastructure Implementation

This project demonstrates the manual configuration of a foundational AWS networking environment and the deployment of a web server on a compute instance. The goal was to establish a functional public-facing architecture from scratch.

## Project Objectives

* **Network Provisioning:** Constructing a custom Virtual Private Cloud (VPC).
* **Public Connectivity:** Implementing subnets and routing for internet access.
* **Compute Deployment:** Launching and configuring an Amazon EC2 instance.
* **Web Services:** Installing and securing a web server.

## Technical Implementation Steps

### 1. Networking Foundation

* **VPC Creation:** Defined a custom VPC to isolate the infrastructure.
* **Public Subnet:** Created a subnet within the VPC to host public-facing resources.
* **Internet Gateway:** Attached an IGW and updated route tables to allow external traffic flow.

### 2. Instance Launch and Security

* **EC2 Provisioning:** Launched a Linux-based EC2 instance within the public subnet.
* **Security Groups:** Configured firewall rules to permit specific traffic:
* **Port 22 (SSH):** For remote administrative access.
* **Port 80 (HTTP):** To allow public web traffic.

### 3. Server Configuration

* **Remote Access:** Established a secure connection via SSH.
* **Web Server Installation:** Deployed Nginx as the primary web server.
* **Content Customization:** Modified the default `index.html` to serve custom portfolio content.

## Architecture diagram
![alt text](https://github.com/makkianjum/Cloud-portfolio/blob/ec2-vpc-infra/ec2-vpc-infra.png?raw=true)