# Vagrant CoreOS baremetal
This repository contains everything to set up a CoreOS Kubernetes cluster in Virtualbox using Vagrant just the same way as is done in the baremetal clusters at source{d}.
This is meant to be a playground to experiment with changes to the setup of baremetal clusters without having to deploy it on actual machines. The setup is as much the same as a production setup as possible. There are security compromises made (set passwords, private keys exposed) in this setup to make it easy to set up, you should *never* use these files to set up a production cluster without modifications.

## Structure
There are 2 types of machines, the Provisioner will serve DHCP and Ignition configuration (via Matchbox), it also is responsible for running all scripts to set up the systems. This one runs Ubuntu 18.04. In this setup it also acts as a NAT router between the Virtualbox NAT and the internal PXE network.
The controllers will boot from the PXE profile served through the provisioner, the controllers only have an interface to the PXE network with a fixed MAC.
The controllers will start a kubernetes and etcd cluster, note that there is no persistent disks set up by default so all data is stored in RAM. There are 3 disks in the VM which are used to experiment with RAID setups and disk partitioning.


```
                                                 +--------------+
                                                 | Controller 1 |
                                                 +--------------+
+-------------+                                  +--------------+
| Provisioner | <---> internal pxe network <---> | Controller 2 |
+-------------+                                  +--------------+
                                                 +--------------+
                                                 | Controller 3 |
                                                 +--------------+
```

## How to use
You need:
* Vagrant
* Virtualbox 5+ (only Virtualbox is supported for now)
* A copy of this repo

Install the PXE boot Vagrant box:
```
~$ vagrant box add pxe-boot-3-disk pxe-boot-3-disk.box
```
This box contains an empty VM configured to boot PXE and has 3 500GB (empty) SATA disks connected.

Run the VM:
```
~$ vagrant up
```
Make sure you have ports `2211`,`2212`,`2213` free, keep counting if you add more than 3 CoreOS VMs. These are proxies ran on the provisioner VM to trick vagrant into SSHing into the CoreOS VMs even though these are set up not to have a NAT interface (conflicts with the setup due to DHCP).

On boot of the provisioner VM it will provisioner it will provision itself using Ansible and configure Matchbox using the Terraform files in this repo.
To make changes you can either destroy the cluster of use `vagrant provision` to apply both Terraform and Ansible changes.
