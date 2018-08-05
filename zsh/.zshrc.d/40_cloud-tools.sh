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
                    amontaigu/terraform:0.11.7 "$@"
}


# ------------------------------------------------------------
# RANCHER cli
# ------------------------------------------------------------
rc(){
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    -w /data \
                    --volumes-from $(hostname) \
                    rancher/cli:v2.0.3 "$@"
}


# ------------------------------------------------------------
# RANCHER cli
# ------------------------------------------------------------
as(){

    # Check specific options
    ARGS=""
    case "${1}" in
        "--cs-cert-off")
            export CS_CERT="NO_VERIF"
            return 0
            ;;
        "--cs-cert-on")
            export CS_CERT=""
            return 0
            ;;
        "pb")
            ARGS="ansible-playbook"
            shift
            ;;
    esac
    
    # Main command
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -e CS_CERT="${CS_CERT}" \
                    -v "$(pwd)":/data \
                    -w /data \
                    --volumes-from $(hostname) \
                    amontaigu/ansible:2.6.2 $ARGS "$@"
}
