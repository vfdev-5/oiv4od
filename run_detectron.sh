#!/bin/sh

container_name="detectron"
image_name=detectron
image_version=latest

echo "Run iteractive terminal from docker image '${image_name}'"

docker run -it \
         --runtime=nvidia \
         --name ${container_name} \
         -p 8828:8828 \
         -p 6026:6026 \
         -v /home/vfdev-5/:/home/project \
         -v /mnt/data:/home/data \
         --shm-size 16G \
         ${image_name}:${image_version} \
         jupyter notebook --allow-root --no-browser --ip=* --port=8828 --notebook-dir=/
