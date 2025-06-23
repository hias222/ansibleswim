#!/bin/bash

AWS_DOMAIN_NAME={{nginx_aws_name}}

DISTRI_ID=$(aws cloudfront list-distributions --query "DistributionList.Items[*].{id:Id,alias:Aliases.Items[0]}[?alias=='${AWS_DOMAIN_NAME}']" --output=text | awk  '{print $2}')
echo distr $DISTRI_ID

# with AWS_PAGER="" as the v2 migration guide stated:
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/frontend/downloads.json"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/frontend/*"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/*"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/**"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/splashdata/**"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/splashdata/bezirk/common/*"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/splashdata/bezirk/result/*"
AWS_PAGER="" aws cloudfront create-invalidation --distribution-id $DISTRI_ID --paths "/splashdata/bezirk/*"
