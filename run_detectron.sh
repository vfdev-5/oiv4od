#!/bin/sh

container_name="detectron"
image_name=detectron-pytorch
image_version=oiv4

echo "Run iteractive terminal from docker image '${image_name}'"

docker run -it \
         --runtime=nvidia \
         --name ${container_name} \
         -p 8888:8888 \
         -p 6006:6006 \
         -v /home/vfdev-5/:/home/project \
         -v /mnt/data:/home/data \
         --shm-size 16G \
         ${image_name}:${image_version} \
jupyter notebook --allow-root --no-browser --ip=* --port=8888 --notebook-dir=/
