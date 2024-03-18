# VMware Packer Ubuntu 20.04

This repository simplifies the process of creating a template in vCenter 8.0 using Packer.

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Generating a Hashed Password](#generating-a-hashed-password)
- [Running Packer Build with HCL](#running-packer-build-with-hcl)
- [Directory Structure](#directory-structure)
- [Reference](#reference)

## Getting Started

This project was developed and tested on an Intel NUC 13 Pro i5 with 64GB RAM, running VMware ESXi 8.0, vCenter 8.0, and a VyOS server for home network and lab communication.

## Prerequisites

Ensure you have the following:

- ESXi 6.7 or later
- vCenter 6.7 or later
- Packer 

## Installation

Follow these steps:

1. Install Packer: [Getting Started with Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
2. Install the vSphere plugin: [Packer vSphere Plugin](https://developer.hashicorp.com/packer/integrations/hashicorp/vsphere)

## Generating a Hashed Password

To generate a hashed password for identity in user-data, follow the instructions in the [official documentation](https://canonical-subiquity.readthedocs-hosted.com/en/latest/reference/autoinstall-reference.html). OpenSSL was used in this instance, but you can use `mkpasswd` from the `whois` package.

```bash
openssl passwd -6 -salt $(openssl rand -base64 12) ubuntu

```

## Running Packer Build with HCL
Execute the following command to build with HCL: 

```bash
packer build -force -on-error=ask -var-file variables.pkrvars100GBdisk.hcl -var-file vsphere.pkrvars.hcl ubuntu-22.04.pkr.hcl
```

## Directory Structure

```bash
├── README.md
├── http
│   ├── meta-data
│   └── user-data
├── password
├── scripts
│   └── setup_ubuntu2204_withDocker.sh
├── ubuntu-22.04.pkr.hcl
├── variables.pkrvars100GBdisk.hcl
└── vsphere.pkrvars.hcl
```

This project follows the directory structure:

- `README.md`: Project documentation.
- `http:`: Contains meta-data and user-data files.
- `password`: Password file.
- `scripts`: Contains setup script.
- `ubuntu-22.04.pkr.hcl`: Packer configuration file.
- `variables.pkrvars100GBdisk.hcl`: Template variables file.
- `vsphere.pkrvars.hcl`: vSphere variables file.


## Reference 

https://www.youtube.com/watch?v=FvQuVWk2f6s&list=PL-7fHWfrqQvFzMsSMCgrW-eCaEJ4tFUEi&index=6
