# ============================================================
# Cloud related tools
# ============================================================


# ------------------------------------------------------------
# TERRAFORM
# ------------------------------------------------------------
tf(){

    # Note 1: Terraform must be run @local
    # Note 2 : current parent host dir is mounted in /data careful will work
    #          only for /vagrant since the path is taken from boot2docker 
    #          and not dk tb (inception !!)
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    --volumes-from $(hostname) \
                    amontaigu/terraform:0.10.7 "$@"
}


# ------------------------------------------------------------
# RANCHER cli
# ------------------------------------------------------------
rc(){

    # Note 1: rancher cli must be run @local
    # Note 2 : current parent host dir is mounted in /data careful will work
    #          only for /vagrant since the path is taken from boot2docker 
    #          and not dk tb (inception !!)
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$(pwd)":/data \
                    -w /data \
                    --volumes-from $(hostname) \
                    rancher/cli:v0.6.4 "$@"
}
