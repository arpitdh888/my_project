#!/bin/bash

# Define new IP details
NEW_IP="192.168.43.12/24"   # IP address with CIDR notation
NEW_GATEWAY="192.168.43.193"
NEW_DNS="8.8.8.8"
INTERFACE="enp0s3"   # Explicitly setting the interface

echo "Changing IP address of $INTERFACE..."

# Set static IP configuration
nmcli con mod $INTERFACE ipv4.method manual
nmcli con mod $INTERFACE ipv4.addresses $NEW_IP
nmcli con mod $INTERFACE ipv4.gateway $NEW_GATEWAY
nmcli con mod $INTERFACE ipv4.dns $NEW_DNS

# Apply changes
nmcli con down $INTERFACE && nmcli con up $INTERFACE

# Show new IP
echo "New IP configuration for $INTERFACE:"
ip addr show $INTERFACE

echo "IP address changed to $NEW_IP successfully!"

