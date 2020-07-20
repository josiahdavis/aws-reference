#!/usr/bin/env bash
# Utility for checking permissions for new account

runc() {
    $1 &>/dev/null
    if [ $? -eq 0 ]; then 
        echo "works  | $1"
    else
        echo "failed | $1"
    fi
}

echo " "
runc "aws s3 ls"
runc "aws ecr describe-repositories"
runc "aws iam list-policies"
runc "aws iam list-roles"
runc "aws ec2 run-instances --image-id ami-0487874ffa1361b7a"
echo " "

