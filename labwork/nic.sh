#! /bin/bash

# All NIC related things, because that's where it starts.

# Check your ethernent controller
lspci | grep -i ethernet

# List all network devices on your system
# This also displays the driver associated with this device
# and other device details.
sudo lshw -class network
