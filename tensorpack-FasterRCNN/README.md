# Faster-RCNN / Mask-RCNN on OpenImages V4 dataset

This example provides a minimal (<2k lines) and faithful implementation of the following papers:

+ [Faster R-CNN: Towards Real-Time Object Detection with Region Proposal Networks](https://arxiv.org/abs/1506.01497)
+ [Feature Pyramid Networks for Object Detection](https://arxiv.org/abs/1612.03144)
+ [Mask R-CNN](https://arxiv.org/abs/1703.06870)

with the support of:
+ Multi-GPU / distributed training
+ [Cross-GPU BatchNorm](https://arxiv.org/abs/1711.07240)

## Dependencies
+ Python 3; TensorFlow >= 1.6 (1.4 or 1.5 can run but may crash due to a TF bug);
+ [pycocotools](https://github.com/pdollar/coco/tree/master/PythonAPI/pycocotools), OpenCV.
+ Pre-trained [ImageNet ResNet model](http://models.tensorpack.com/ResNet/) from tensorpack model zoo.
+ OpenImages V4 data. It needs to have the following directory structure:
```
OpenImages/DIR/
  annotations/
    train.json
    val.json
  train/
    *.jpg
  val/
    *.jpg
```

## Usage

### Training

To train:
```
./train.py --config \
    MODE_MASK=True MODE_FPN=True \
    DATA.BASEDIR=/path/to/COCO/DIR \
    BACKBONE.WEIGHTS=/path/to/ImageNet-ResNet50.npz \
```
Options can be changed by either the command line or the `config.py` file. 
Recommended configurations are listed in the table below.

The code is only valid for training with 1, 2, 4 or 8 GPUs.
Not training with 8 GPUs may result in different performance from the table below.


### Prediction & evaluation

To predict on an image (and show output in a window):
```
./train.py --predict input.jpg --load /path/to/model --config SAME-AS-TRAINING
```

Evaluate the performance of a model on OpenImages, and save results to json.
(Trained COCO models can be downloaded in [model zoo](http://models.tensorpack.com/FasterRCNN):
```
./train.py --evaluate output.json --load /path/to/COCO-ResNet50-MaskRCNN.npz \
    --config MODE_MASK=True DATA.BASEDIR=/path/to/OpenImages/DIR
```
Evaluation or prediction will need the same config used during training.
