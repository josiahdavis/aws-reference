#!/bin/bash
# Deep Learning Query Tool (dlq)
# This script creates a mapping of AMIs across regions.
# Example:
#   ./dlq.sh
#   ./dlq.sh [<ami name>] [<output file>]
# 
# Example output
# -----
# us-east-1: 
#   AMI: ami-0f840415174c4a8e0
# ....
# sa-east-1: 
#   AMI: ami-093e3f53198605e7d

AMI=${1:-"Deep Learning AMI (Amazon Linux 2) Version 47.0"}
OUTPUT=${2:-"/tmp/amis.yaml"}

declare -a REGIONS=( 
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
    REGION=$1
    ID=$(aws ec2 describe-images \
            --owners amazon \
            --filters "Name=name,Values=${AMI}" "Name=state,Values=available" \
            --query "reverse(sort_by(Images, &CreationDate))[:1].ImageId" \
            --output text \
            --region $REGION)
}

get_all_ami_ids() {
    echo "-----" > $OUTPUT
    for REGION in "${REGIONS[@]}"; do
        get_ami_id $REGION &>/dev/null
        if [ $? -eq 0 ]; then
            YAML="    ${REGION}:\n      AMI: ${ID}"
            echo -e "$YAML" >> $OUTPUT
        else
            echo "${AMI} not found for ${REGION}"
        fi
    done
    echo "Mapping file written to ${OUTPUT}"
}

get_all_ami_ids
