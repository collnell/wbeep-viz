FROM debian:stretch

LABEL maintainer="tworr@usgs.gov"

# Run updates and install curl
RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install curl -y && \
      apt-get purge -y --auto-remove && \
      apt-get clean
      
# Enable the NodeSource repository and install the latest nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
      apt-get install nodejs -y

# Create temp directory for building viz app
RUN mkdir -p /tmp/wbeep-viz-app

# Copy source code.  Note that we need to exclude the mbtiles
# directory from the repo using .dockerignore because 
# we're only building the viz (tiles are created separately -
# mbtiles is included in the repo for local test builds).
WORKDIR /tmp/wbeep-viz-app
COPY . .
# Set environment variable for build target and then run config.sh
# to set the correct S3 HRU tile source in the Mapbox configuration file.
ARG BUILDTARGET=""
ENV E_BUILDTARGET=$BUILDTARGET
RUN chmod +x ./config.sh && ./config.sh

# Build the Vue app.
RUN npm install
RUN npm run build