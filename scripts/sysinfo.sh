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
lscpu 2> /dev/null || grep "model name" /proc/cpuinfo | head -1
