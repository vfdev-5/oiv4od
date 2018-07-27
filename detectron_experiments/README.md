# OpenImagesV4 detection object challenge with Detectron

## Installation

We build a docker image from Dockerfile from detectron repository.
See [installation guide](https://github.com/facebookresearch/Detectron/blob/master/INSTALL.md)

In the docker container we need to replace original source code by customized from this repository:
```
export path="/path/to/OpenImagesObjectDetection/detectron"
cp -R /detectron/ ${path}
mv detectron/ /detectron_original/
chown 1000:1000 -R ${path}
ln -s {path} $/detectron
```

NB.: Detectron repository is copied here and contains modifications to be able
to work with OpenImages V4 datasets and report training stats with [c2board](https://github.com/endernewton/c2board.git)

`c2board` is also slightly modified to work with Detectron's Caffe2 version:
```
def _operators_to_graph_def(ops,
-                            clear_debug_info=True,
-                            single_gpu=False,
+                            clear_debug_info=False,
+                            single_gpu=True,
```

### Install c2board

#### Install protoc3
https://gist.github.com/SofyanHadiA/37787e5ed098c97919b8c593f0ec44d8

Run `python setup.py install`

## Setup dataset

Following detectron's recommendation xview tiles dataset in MSCoco format is need to be put (we use symlinks) into
`detectron/detectron/datasets/data`

## How to train and predict

- Setup a configuration file
- Run a script

See `shell.ipynb` as example