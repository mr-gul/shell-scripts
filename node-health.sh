#!/bin/bash


###################################
# Author: Gulraiz
# Date: 08-01-2025

# the scripts shows the node health

#version: v1

#set -x 
set -e
set -o pipefail


df -h

echo "checking free space..."
free -h

echo "checking logical cpu allocated..."
nproc

echo "checking running porcess..."
ps -ef | grep youtube |awk -F " " '{print $2}'
