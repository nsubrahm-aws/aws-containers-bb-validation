#!/bin/bash

set -e 

t_policy() {
  REGION_ID=$1
  ACCOUNT_ID=$2

  JSON_DIR=../json
  cd ${JSON_DIR}
  
  sed -e 's/regionId/'"${REGION_ID}"'/g' -e 's/accountId/'"${ACCOUNT_ID}"'/g' ${JSON_DIR}/sqs-policy.json > ${JSON_DIR}/sqs-policy.json.policy
  POLICY_ARN=`aws iam create-policy --policy-name sqs-policy --policy-document file://sqs-policy.json.policy --query 'Policy.Arn' --output text`
  echo "SQS Policy ARN: ${POLICY_ARN}"

  sed -e 's/regionId/'"${REGION_ID}"'/g' -e 's/accountId/'"${ACCOUNT_ID}"'/g' ${JSON_DIR}/sns-policy.json > ${JSON_DIR}/sns-policy.json.policy
  POLICY_ARN=`aws iam create-policy --policy-name sns-policy --policy-document file://sns-policy.json.policy --query 'Policy.Arn' --output text`
  echo "SNS Policy ARN: ${POLICY_ARN}"

  rm ${JSON_DIR}/sqs-policy.json.policy
  rm ${JSON_DIR}/sns-policy.json.policy
}

e_policy() {
  REGION_ID=$1
  ACCOUNT_ID=$2

  JSON_DIR=../json
  cd ${JSON_DIR}

  curl -s -o elb-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json

  POLICY_ARN=`aws iam create-policy --policy-name elb-policy --policy-document file://elb-policy.json --query 'Policy.Arn' --output text`
  echo "ELB Policy ARN: ${POLICY_ARN}"
}

if [[ $# -ne 2 ]] ; then
  echo 'USAGE: ./iam.sh regionId accountId'
  exit 1
fi

REGION_ID=$1
ACCOUNT_ID=$2

t_policy ${REGION_ID} ${ACCOUNT_ID}
e_policy