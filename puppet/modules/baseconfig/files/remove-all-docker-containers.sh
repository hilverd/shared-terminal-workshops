#! /bin/bash
#
# Removes all Docker containers, including running ones.

docker ps -aq | xargs docker rm -f
