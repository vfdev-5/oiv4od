# OpenImages V4 dataset for Detectron

import os

# Path to data dir
assert 'DATA_DIR' in os.environ
_DATA_DIR = os.environ['DATA_DIR']

# Required dataset entry keys
IM_DIR = 'image_directory'
ANN_FN = 'annotation_file'

# Available datasets
DATASETS = {
    'open_images_v4_train_overfit': {
        IM_DIR:
            _DATA_DIR + '/train_overfit',
        ANN_FN:
            _DATA_DIR + '/annotations/train_overfit.json'
    },
    'open_images_v4_train': {
        IM_DIR:
            _DATA_DIR + '/train',
        ANN_FN:
            _DATA_DIR + '/annotations/train.json'
    },
    'open_images_v4_test': {
        IM_DIR:
            _DATA_DIR + '/test',
        ANN_FN:
            _DATA_DIR + '/annotations/test.json'
    },
    'open_images_v4_val': {
        IM_DIR:
            _DATA_DIR + '/val',
        ANN_FN:
            _DATA_DIR + '/annotations/val.json'
    },
    'open_images_v4_challenge': {
        IM_DIR:
            _DATA_DIR + '/test_challenge',
        ANN_FN:
            _DATA_DIR + '/annotations/test_challenge.json'
    },
}
