#!/bin/bash

host_name=$(hostname)
current_time=$(date "+%Y-%m-%d %H:%M:%S")

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
log_file="$script_dir/$host_name.log"

if [ -z "$SHELL_LOG_APPENDED" ]; then
    echo "hostname: $host_name" >> "$log_file"
    echo "systemtime: $current_time" >> "$log_file"

    export SHELL_LOG_APPENDED="true"

    cd "$script_dir"

    git add .
    git commit -m "hi($host_name.log): login in $host_name at $current_time"
    git push
fi

