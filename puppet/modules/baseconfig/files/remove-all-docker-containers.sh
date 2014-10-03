#! /bin/bash
#
# Removes all Docker containers, including running ones.

docker ps -aq | xargs --no-run-if-empty docker rm -f
