#!/bin/bash

# =======================================================================
#
# Features to help testing with bats
#
# @see https://github.com/sstephenson/bats
# @see https://blog.engineyard.com/2014/bats-test-command-line-tools
#
# =======================================================================


# Allows to exec a command inside the container
# Assuming the entrypoint is a shell !
dk_cmd() {
    if [ $# -eq 2 ]; then
        docker run --rm $1 -c "$2"
    else
        echo "Usage: dk-cmd CONTAINER COMMAND"
    fi
}
