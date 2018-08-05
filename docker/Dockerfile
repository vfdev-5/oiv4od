FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04
MAINTAINER vfdev-5

LABEL version="0.1"
LABEL description="Image with Pytorch/Detectron.pytorch"


# Update all
RUN apt-get update


# Setup en_US locale
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


# Install dependencies:
RUN apt-get install -y --no-install-recommends \
	build-essential \
	curl \
	wget \
	python3 \
	python3-dev \
	python3-pip \
	graphviz \
	git \
    p7zip-full \
	cmake


RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN pip3 install --upgrade pip


# Install python packages
RUN pip3 install --no-cache-dir setuptools


RUN pip3 install --no-cache-dir \
	wheel \
	numpy \
	scipy \
	matplotlib \
    seaborn \
	pandas \
	sklearn \
	Cython \
	opencv-python \
	ipykernel \
	jupyter \
	pydot \
	graphviz \
	joblib \
    jupyterlab \
    kaggle


# Install pytorch and torch vision
RUN pip3 --no-cache-dir install --upgrade \
	http://download.pytorch.org/whl/cu92/torch-0.4.1-cp35-cp35m-linux_x86_64.whl


RUN pip3 --no-cache-dir install --upgrade torchvision \
	visdom \
	git+https://github.com/lanpa/tensorboard-pytorch \
	tensorboard


# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

RUN apt-get update && apt-get install -y --no-install-recommends zlib1g-dev libjpeg-dev
RUN CC="cc -mavx2" pip3 install --no-cache-dir pillow-simd


RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN jupyter serverextension enable --py jupyterlab --sys-prefix

# Expose port for jupyter notebook
EXPOSE 8888
