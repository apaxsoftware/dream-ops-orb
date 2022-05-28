#!/usr/bin/env bash
# shellcheck disable=SC2162

# Compile arguments
args=()
(( FORCE_SETUP == 1 )) && args+=( '-f' )
read -a TARGETS <<< "$TARGETS"
args+=( '-T' "${TARGETS[@]}" )

# Execute deployment
dream deploy opsworks "${args[@]}"
