#!/bin/bash
# Deep Learning Query Tool (dlq)
# This script creates a mapping of AMIs across regions.
# Example:
#   ./dlq.sh
#   ./dlq.sh [<ami name>]

AMI=${1:-"Deep Learning AMI (Amazon Linux 2) Version 40.0"}

declare -a regions=( 
    "us-east-1"
    "us-east-2"
    "us-west-1" 
    "us-west-2" 
    "af-south-1"
    "ap-east-1"
    "ap-south-1"
    "ap-northeast-1"
    "ap-northeast-2"
    "ap-northeast-3"
    "ap-southeast-1" 
    "ap-southeast-2" 
    "ca-central-1"
    "eu-central-1"
    "eu-west-1"
    "eu-west-2"
    "eu-west-3"
    "eu-south-1"
    "eu-north-1"
    "me-south-1"
    "sa-east-1"
)

get_ami_id() {
    region=$1
    ID=$(aws ec2 describe-images \
            --owners amazon \
            --filters "Name=name,Values=${AMI}" "Name=state,Values=available" \
            --query "reverse(sort_by(Images, &CreationDate))[:1].ImageId" \
            --output text \
            --region $region)
}

get_all_ami_ids() {
    echo "-----" > /tmp/amis.yaml
    for region in "${regions[@]}"; do
        get_ami_id $region &>/dev/null
        if [ $? -eq 0 ]; then
            YAML="${region}: \n\tAMI: ${ID}"
            echo -e $YAML >> /tmp/amis.yaml
        else
            echo "${AMI} not found for ${region}"
        fi
    done
}

get_all_ami_ids
