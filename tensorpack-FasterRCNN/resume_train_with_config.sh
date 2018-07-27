#!/bin/bash


python3 train.py \
    --config \
    DATA.BASEDIR=../input/as_mscoco \
    DATA.TRAIN="['test', 'val_0.9']" \
    DATA.VAL="val_0.1" \
    MODE_MASK=False \
    MODE_FPN=True \
    FRCNN.BATCH_PER_IM=48 \
    PREPROC.SHORT_EDGE_SIZE=800 PREPROC.MAX_SIZE=1124 \
    TRAIN.BASE_LR=0.01 \
    TRAIN.GAMMA=0.2 \
    TRAIN.LR_SCHEDULE=[51000,65000,80000,90000] \
    TRAIN.EVAL_INTERVAL_EPOCH=30 \
    TRAIN.STEPS_PER_EPOCH=1000 \
    --load=/home/storage_ntfs_1tb/OpenImagesObjectDetections/output/20180708_2117/model-50000 \
    --logdir \
    /home/storage_ntfs_1tb/OpenImagesObjectDetections/output
