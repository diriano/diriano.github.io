#!/usr/bin/env bash
set -o errexit -o pipefail

# Set the script directory
SCRIPT_DIR="$(dirname $(readlink -f ${0}))"

# Set parent directory
PARENT_DIR="$(dirname ${SCRIPT_DIR})"

# Set the cache directory
CACHE_DIR="${PARENT_DIR}/resources/cache"

# Purge the cache
rm -rfv ${CACHE_DIR}/*
