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

```
# Make sure you grab the latest version
curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip

# Unzip
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
sudo mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
sudo mv protoc3/include/* /usr/local/include/
```

Run `make`

## Setup dataset

Run cells from `notebooks/convert_to_mscoco_format.ipynb` to convert dataset into MSCoco format

## Download weights

Download weights from [model zoo](https://github.com/facebookresearch/Detectron/blob/master/MODEL_ZOO.md#end-to-end-faster--mask-r-cnn-baselines)

```
wget https://s3-us-west-2.amazonaws.com/detectron/35858015/12_2017_baselines/e2e_faster_rcnn_X-101-64x4d-FPN_1x.yaml.01_40_54.1xc565DE/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl
```

## How to train and predict

- Setup a configuration file
- Run a script

See `shell.ipynb` as example