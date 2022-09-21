#!/bin/bash
inet=$(ifconfig | grep -i "inet ")
echo "IPv4 Adresses:"
echo "$inet"
