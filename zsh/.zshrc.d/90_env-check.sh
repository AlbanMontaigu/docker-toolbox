
# =====================================================
# Various check regarding environment
#
# NOTE: need to occur lately in the bootstrap process
# =====================================================


# ------------------------------------------------------------
# Display information regarding versions
# ------------------------------------------------------------
version_check(){

    # Get remote version (latest)
    DKTB_LATEST_VERSION=$(curl -m15 -skL https://raw.githubusercontent.com/AlbanMontaigu/docker-toolbox/latest/VERSION)

    # Error management
    if [ $? != 0 ]; then
        return 1
    fi

    # Display information
    if ([[ "${DKTB_LATEST_VERSION}" == "${DKTB_VERSION}" ]]); then
        echo "[INFO] Congratulations ! You have the last version of dk tb (${DKTB_VERSION})"
        return 0
    else
        echo "[INFO] You may consider checking your dk tb version (yours=${DKTB_VERSION}, latest=${DKTB_LATEST_VERSION})"
        return 2
    fi
}

# Do the check but not blocking
version_check
