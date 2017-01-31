#!/usr/bin/env bash
set -o errexit -o pipefail

# Get script running diectory
SCRIPT_DIR="$(dirname $(readlink -f ${0}))"

# Set some variables
ARCHIVE_URL="http://github.com/downloads/UberGallery/scripts/sample-images.tar.gz"
IMAGES_DIR="$(dirname ${SCRIPT_DIR})/gallery-images"

## Check if image archive exists
FILE_EXISTS="$(wget --spider -qO /dev/null ${ARCHIVE_URL} && echo 'true' || echo 'false')"

## Error on non-existent image archive
if [[ "${FILE_EXISTS}" == false ]]; then
    echo "ERROR: Unable to locate image archive at ${ARCHIVE_URL}"; exit 1
fi

# Fetch the archive
echo "Downloading image archive from ${ARCHIVE_URL} and extracting to ${IMAGES_DIR}"
wget -qO- ${ARCHIVE_URL} | tar -xzv -C ${IMAGES_DIR}
