# ============================================================
# Docker custom commands
# ============================================================


# ------------------------------------------------------------
# Docker host management
#
# NOTE : Enables to switch to local or remote host
# ------------------------------------------------------------
dk_host(){
    if [ $# -gt 1 ]; then
        dk_host_help
    elif [[ "$1" == "" ]]; then
        echo "DOCKER_HOST_ID=$(dk_host_id)"
    elif [[ "$1" == "--id" ]]; then
        echo "$(dk_host_id)"
    else
        dk_host_change "$1"
    fi
}

# Help related to the main dk_host command
dk_host_help(){
    echo "Usage: dk host [HOST_ID]"
    echo ""
    echo "Changes or shows where the docker client is connected."
}

# Checks if requested host is defined
dk_host_check(){
    DK_HOST_FUNC="dk_host_$1"
    if type $DK_HOST_FUNC | grep -i function > /dev/null; then
        return 0 # OK
    else
        return 1 # KO
    fi
}

# Changes docker host with specified param if related definition present
dk_host_change(){

    # Default DOCKER_HOST_ID
    NEW_DOCKER_HOST_ID="local"
    if [ $# -eq 1 ]; then
        NEW_DOCKER_HOST_ID="$1"
    fi

    # Check and do the change
    dk_host_check "$NEW_DOCKER_HOST_ID"
    if [ $? -eq 0 ]; then
        export DOCKER_HOST_ID="$NEW_DOCKER_HOST_ID"
        export http_proxy="$(dk_host_current_http_proxy)"
        export HTTP_PROXY="$http_proxy"
        export https_proxy="$(dk_host_current_https_proxy)"
        export HTTPS_PROXY="$https_proxy"
        export no_proxy="$(dk_host_current_no_proxy)"
        export NO_PROXY="$no_proxy"
        export DOCKER_HOST="$(dk_host_current)"
        echo "[INFO] Docker host changed to DOCKER_HOST_ID=$1"
    else
        echo "[ERROR] Docker host definition not found for DOCKER_HOST_ID=$1"
    fi
}

# Current DOCKER_HOST_ID with fallback to local if not defined
dk_host_id(){
    # No param or current conf
    if [ -z "$DOCKER_HOST_ID" ]; then
        echo "local" # Default
    else
        echo "$DOCKER_HOST_ID"
    fi
}
dk_host_current(){
    eval "dk_host_$(dk_host_id)"
}
dk_host_current_http_proxy(){
    eval "dk_host_$(dk_host_id)_http_proxy"
}
dk_host_current_https_proxy(){
    eval "dk_host_$(dk_host_id)_https_proxy"
}
dk_host_current_no_proxy(){
    eval "dk_host_$(dk_host_id)_no_proxy"
}


# ------------------------------------------------------------
# Show ip of a docker container
# ------------------------------------------------------------
dk_ip(){
    if [ $# -eq 1 ]; then
        sx docker inspect --format \"{{ .NetworkSettings.IPAddress }}\" $1
    else
        dk_ip_help
    fi
}

dk_ip_help(){
    echo "Usage: dk ip CONTAINER"
    echo ""
    echo "Show ip of a docker container."
}


# ------------------------------------------------------------
# Kill all running containers
# ------------------------------------------------------------
dk_killa(){
    sx docker kill $(docker ps -q)
}

dk_killa_help(){
    echo "Usage: dk killa"
    echo ""
    echo "Kill all running containers."
}


# ------------------------------------------------------------
# Get a shell inside a container
# ------------------------------------------------------------
dk_shc() {
    if [ $# -eq 1 ]; then
        sx docker exec -ti $1 /bin/sh
    else
        dk_shc_help
    fi
}

dk_shc_help(){
    echo "Usage: dk shc CONTAINER"
    echo ""
    echo "Starts a shell inside a container."
}


# ------------------------------------------------------------
# Get a shell in a container started from the specified image
# ------------------------------------------------------------
dk_shi() {
    if [ $# -eq 1 ]; then
        sx docker run -it --rm --entrypoint="/bin/sh" $1
    else
        dk_shi_help
    fi
}

dk_shi_help(){
    echo "Usage: dk shi IMAGE"
    echo ""
    echo "Runs an image as a container and start a shell inside."
}


# ------------------------------------------------------------
# Follow logs of a container
# ------------------------------------------------------------
dk_logsf(){
    if [ $# -eq 1 ]; then
        sx docker logs -f $1
    else
        dk_logsf_help
    fi
}

dk_logsf_help(){
    echo "Usage: dk logsf CONTAINER"
    echo ""
    echo "Follow logs of a container."
}


# ------------------------------------------------------------
# Update all available images
# ------------------------------------------------------------
dk_ipull(){
    docker images | grep -v REPOSITORY | grep -Ev  '<none>' |awk '{print $1":"$2}' | xargs -n1 docker pull
}

dk_ipull_help(){
    echo "Usage: dk ipull"
    echo ""
    echo "Update all available images."
}


# ------------------------------------------------------------
# Show docker usage + information about custom commands
# ------------------------------------------------------------
dk_custom_usage(){
    echo
    echo "dk = docker alias with enhancements."
    echo
    docker | sed 's/docker/dk/g'
    echo
    echo "Custom dk commands:"
    echo "    ip        Show ip of a docker container"
    echo "    ipull     Update all available images"
    echo "    killa     Kill all running containers"
    echo "    shc       Get a shell inside a container"
    echo "    shi       Get a shell in a container started from the specified image"
    echo "    logsf     Follow logs of a container"
    echo "    host      Changes or shows where the docker client is connected"
}


# ------------------------------------------------------------
# Help complements
# ------------------------------------------------------------
dk_help(){
    case "$1" in
        ip) dk_ip_help
            ;;
        ipull) dk_ipull_help
            ;;
        killa) dk_killa_help
            ;;
        shc) dk_shc_help
            ;;
        shi) dk_shi_help
            ;;
        logsf) dk_logsf_help
            ;;
        host) dk_host_help
            ;;
        "--help") docker
            ;;
        "") docker
            ;;
        *) docker "$@" --help
            ;;
    esac
}


# ------------------------------------------------------------
# Docker command plus new features for it
# ------------------------------------------------------------
dk(){

    # Check if help is requested
    if [[ "${@: -1}" == "--help" ]] ; then
        dk_help "$1"
        return 0
    fi

    # Current docker host
    dk_host_rollback="_NA_"

    # Read first argument to see if its host tag
    if [[ "$1" =~ "[@]+" ]]; then

        # Select new host with @ tag removed
        dk_host_rollback=$(dk_host --id)
        dk_host_change "${1:1}"

        # Shift arguments list since the tag arg will be consumed
        shift
    fi

    # Select with command to execute
    case "$1" in
        ip) dk_ip "$2"
            ;;
        ipull) dk_ipull
            ;;
        killa) dk_killa
            ;;
        shc) dk_shc "$2"
            ;;
        shi) dk_shi "$2"
            ;;
        logsf) dk_logsf "$2"
            ;;
        host) dk_host "$2"
            ;;
        "") dk_custom_usage
            ;;
        *) sx docker "$@"
            ;;
    esac

    # Rollback to prev dk_host
    if [[ "${dk_host_rollback}" != "_NA_" ]]; then
        dk_host_change "${dk_host_rollback}"
    fi
}
