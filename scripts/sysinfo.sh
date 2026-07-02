#!/usr/bin/env bash

# print hostname
echo "=== HOSTNAME ==="
hostname || uname -n

# print current date and time
echo ""
echo "=== DATE AND TIME ==="
date

# print CPU info
echo ""
echo "=== CPU INFO ==="
lscpu 2> /dev/null | grep -i "model name"

# print memory usage
echo ""
echo "=== MEMORY USAGE ==="
free -h

# print disk uage
echo ""
echo "=== DISK USAGE ==="
df -h
