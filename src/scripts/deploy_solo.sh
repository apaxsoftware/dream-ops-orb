#!/usr/bin/env bash

# Create temp directory to hold key
key_dir=$(mktemp -d dream-orb.XXXXXXXX)

# Set trap to clean up directory
trap 'rm -rf -- "$key_dir"' EXIT

# Write SSH key environment variable to temp file
echo -e ${!SSH_KEY} > $key_dir/deploy.pem
chmod 0400 $key_dir/deploy.pem

dream deploy solo -i $key_dir/deploy.pem -T $TARGETS

rm -rf -- "$key_dir"
trap - EXIT
exit
