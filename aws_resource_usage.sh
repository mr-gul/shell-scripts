#!/bin/bash


######################
# Author: Gulraiz
# Date: 8th-Jan

#Version: v1
#
#This script will report the AWS resource usage 
#
#
#
#
#

# Function to handle AWS CLI commands with error checking
run_aws_command() {
  echo "Running: $1"
  output=$($1 2>&1)
  if [[ $? -ne 0 ]]; then
    echo "Error: $output"
  else
    echo "$output"
  fi
}

# List S3 Buckets
echo "Printing list of S3 buckets"
run_aws_command "aws s3 ls"

# List EC2 instances
echo "Printing list of EC2 instances"
run_aws_command "aws ec2 describe-instances"

# List Lambda functions
echo "Printing list of Lambda functions"
run_aws_command "aws lambda list-functions"

# List IAM users and extract only usernames
echo "Listing IAM users (only usernames)"
iam_users=$(aws iam list-users --query "Users[*].UserName" --output text)
if [[ $? -ne 0 ]]; then
  echo "Error retrieving IAM users."
else
  echo "IAM Usernames: $iam_users"
fi

