
# =====================================================
# Various check regarding environment
#
# NOTE: need to occur lately in the bootstrap process
# =====================================================


# ------------------------------------------------------------
# Display information regarding versions
# ------------------------------------------------------------
version_check(){

# To gain visibility for the message
cat << EOF
 
 
 _    ____  
| \|/  ||_) 
|_/|\  ||_) 
 
EOF

    # Get remote version (latest)
    DKTB_LATEST_VERSION=$(curl -m15 -skL https://raw.githubusercontent.com/AlbanMontaigu/docker-toolbox/latest/VERSION)

    # Error management
    if [ $? != 0 ]; then
        return 1
    fi

    # Display information
    if ([[ "${DKTB_LATEST_VERSION}" == "${DKTB_VERSION}" ]]); then
        echo -e "[INFO] Congratulations ! You have the last version of dk tb (${DKTB_VERSION})\n\n"
        return 0
    else
        echo -e "[INFO] You may consider checking your dk tb version (yours=${DKTB_VERSION}, latest=${DKTB_LATEST_VERSION})\n\n"
        return 2
    fi
}

# Do the check but not blocking
version_check
