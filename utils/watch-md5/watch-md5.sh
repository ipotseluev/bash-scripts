#!/bin/bash
readonly FILEPATH="$1"

watch_file_md5()
{
    local FILE="$1"
    local OUTPUT="watch-$(date +'%X' | sed 's/:/./g').md5"
    truncate -s0 "$OUTPUT"
    while ((1)); do
        echo -n "$(date +'%T') " | tee -a "$OUTPUT"
        md5sum "$FILE" | tee -a "$OUTPUT"
        sleep 2
    done;
} 

watch_file_md5 "$FILEPATH"
