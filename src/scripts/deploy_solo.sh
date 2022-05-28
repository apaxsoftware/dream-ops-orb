#!/usr/bin/env bash
# shellcheck disable=SC2162

# Create temp directory to hold key
key_dir=$(mktemp -d dream-orb.XXXXXXXX)

# Set trap to clean up directory
trap 'rm -rf -- "$key_dir"' EXIT

# Write SSH key environment variable to temp file
echo -e ${!SSH_KEY} > $key_dir/deploy.pem
chmod 0400 $key_dir/deploy.pem


# Compile arguments
args=()
(( FORCE_SETUP == 1 )) && args+=( '-f' )
args+=( '-i' "$key_dir/deploy.pem" )
read -a TARGETS <<< "$TARGETS"
args+=( '-T' "${TARGETS[@]}" )

# Execute deployment
dream deploy solo "${args[@]}"

rm -rf -- "$key_dir"
trap - EXIT
exit
