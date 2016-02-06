# ============================================
# 
# Sample docker file to test builds
# 
# ============================================

# Base image
FROM alpine

# Maintainer
MAINTAINER alban.montaigu@gmail.com

# Environment var to do the test
RUN TEST="OK"

# Docker entrypoint
ENTRYPOINT ["/bin/bash"]

# Try to sho env var
CMD ["echo $TEST"]
