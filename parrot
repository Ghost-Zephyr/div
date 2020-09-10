#!/bin/bash
# Run parrotsec docker container with optional mounted directory as arg. Lots of nice tools inside.
if [ $* ]; then
	MOUNT="-v $*:/opt"
else
	MOUNT=''
fi
docker run --rm -it --cap-add=NET_ADMIN $MOUNT parrotsec/security:latest

