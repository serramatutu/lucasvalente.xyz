#!/bin/bash

if [[ -z "$S3_BUCKET" ]]; then
    echo "You must set the S3_BUCKET environment variable to sync files"
    exit 1;
fi

if [[ -z "$CLOUDFRONT_DISTRIBUTION" ]]; then
    echo "You must set the CLOUDFRONT_DISTRIBUTION environment variable, otherwise edge cache won't be invalidated"
    exit 1;
fi

echo "You're about to release a new version of the website. Type \"release\" to continue."
read answer

if [[ "$answer" != "release" ]]; then
    echo "Releasing aborted."
    exit 0
fi

echo ">>> Building website"
yarn build

echo ">>> Syncing to S3"
aws s3 sync --delete ./dist s3://$S3_BUCKET

echo ">>> Invalidating CloudFront cache"
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION --paths /
