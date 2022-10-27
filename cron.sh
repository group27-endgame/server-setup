#! bin/bash

# Clean old docker files
echo "y" | docker container prune 
echo "y" | docker image prune 
echo "y" | docker volume prune 
echo "y" | docker builder prune

# Clear RAM
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
