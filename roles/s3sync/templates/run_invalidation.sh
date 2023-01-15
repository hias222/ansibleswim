#!/bin/bash

AWS_DOMAIN_NAME={{nginx_aws_name}}

DISTRI_ID=$(aws cloudfront list-distributions --query "DistributionList.Items[*].{id:Id,alias:Aliases.Items[0]}[?alias=='${AWS_DOMAIN_NAME}']" --output=text | awk  '{print $2}')
echo distr $DISTRI_ID

aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/frontend/downloads.json"
aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/frontend/*"
aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/*"