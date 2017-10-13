# ============================================================
# Cloud related tools
# ============================================================

# Note 1: most of cli must be run @local
# Note 2 : current parent host dir is mounted mainly in some /data
#          dir inside the container but careful it will work
#          only for /vagrant since the path is taken from boot2docker 
#          and not dk tb (inception !!)


# ------------------------------------------------------------
# TERRAFORM
# ------------------------------------------------------------
tf(){
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    --volumes-from $(hostname) \
                    amontaigu/terraform:0.10.7 "$@"
}


# ------------------------------------------------------------
# RANCHER cli
# ------------------------------------------------------------
rc(){
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    -w /data \
                    --volumes-from $(hostname) \
                    rancher/cli:v0.6.4 "$@"
}


# ------------------------------------------------------------
# RANCHER cli
# ------------------------------------------------------------
as(){

    # Enable shortcut for ansible-playbook
    ARGS=""
    if [[ "${1}" == "pb" ]]; then
        ARGS="ansible-playbook"
        shift
    fi
    
    # Main command
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    -w /data \
                    --volumes-from $(hostname) \
                    amontaigu/ansible:2.4.0.0 $ARGS "$@"
}
