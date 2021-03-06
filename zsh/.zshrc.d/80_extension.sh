
# ============================================================
# Import extensions not included in the base image
#
# NOTE: prefix the files with a number to manage order
# ============================================================


# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------

# Local
LOGFILE="/var/log/docker-toolbox-extension.log"
CURRENT_DIR=$(pwd)


# ------------------------------------------------------------
# This is optional so if no env var, no extension
# ------------------------------------------------------------
echo "== Starting docker toolbox extension detection [$(date)]" > $LOGFILE
if ([[ "$DKTB_EXTENSION_REPO" == "" ]] || [[ "$DKTB_EXTENSION_VERSION" == "" ]]); then
    echo "== No docker doker-toolbox-extension configured, skiping... [$(date)]" >> $LOGFILE 2>&1
    return 0
else
    echo "== Docker toolbox extension detected... [$(date)]" >> $LOGFILE 2>&1
    echo "     DKTB_EXTENSION_REPO=$DKTB_EXTENSION_REPO" >> $LOGFILE 2>&1
    echo "     DKTB_EXTENSION_VERSION=$DKTB_EXTENSION_VERSION" >> $LOGFILE 2>&1
fi


# ------------------------------------------------------------
# Getting extension files
# ------------------------------------------------------------
echo "== Getting extension files... [$(date)]" >> $LOGFILE 2>&1
rm -rvf $DKTB_EXTENSION_DIR >> $LOGFILE 2>&1
mkdir -p $DKTB_EXTENSION_DIR >> $LOGFILE 2>&1
git clone $DKTB_EXTENSION_REPO $DKTB_EXTENSION_DIR >> $LOGFILE 2>&1
cd $DKTB_EXTENSION_DIR
git checkout $DKTB_EXTENSION_VERSION >> $LOGFILE 2>&1
chmod -R 777 ${DKTB_EXTENSION_DIR} >> $LOGFILE 2>&1
cd $CURRENT_DIR


# ------------------------------------------------------------
# Init extension
# ------------------------------------------------------------
source $DKTB_EXTENSION_DIR/init.sh
