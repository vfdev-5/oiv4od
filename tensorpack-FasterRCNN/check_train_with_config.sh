#!/bin/bash



python3 train.py \
    --config \
    DATA.BASEDIR=../input/as_mscoco \
    DATA.TRAIN="['val_0.3', ]" \
    DATA.VAL="val_0.1" \
    BACKBONE.WEIGHTS=model_weights/ImageNet-ResNet50.npz \
    MODE_MASK=False \
    MODE_FPN=True \
    FRCNN.BATCH_PER_IM=48 \
    PREPROC.SHORT_EDGE_SIZE=800 PREPROC.MAX_SIZE=1124 \
    TRAIN.LR_SCHEDULE=[15000,23000,28000] \
    TRAIN.EVAL_INTERVAL_EPOCH=1 \
    TRAIN.STEPS_PER_EPOCH=1000 \
    --logdir \
    /home/storage_ntfs_1tb/OpenImagesObjectDetections/output
