#!/usr/bin/env bash

# Compile arguments
args=()
(( FORCE_SETUP == 1 )) && args+=( '-f' )
args+=( '-T' "$TARGETS" )

# Execute deployment
dream deploy opsworks "${args[@]}"
