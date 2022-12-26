
### This is repo contains assets for dreambooth-spotty repo.

* Precompiled xformers wheel for dreambooth-spotty
* Currently only V100 and T4 GPUs are supported
* If you another GPU below are instructions how to build xformers for your GPU 

### Building xformers wheel

#### If you have Python3.8, CUDA 11.7 and CUDA TOOLKIT installed you can do the following steps:

* Clone xformers to your PC
  ```shell
    git clone https://github.com/facebookresearch/xformers && cd xformers
  ```
* Checkout to correct version
  ```shell
    git checkout 1d31a3ac3b11f40fde7f00aa64debb0fd4d6f376 -b v0.0.14
  ```
* Update submodules
  ```shell
    git submodule update --init --recursive
  ```
* Build the wheel
  ```shell
    python setup.py bdist_wheel
  ```
* Get the wheel from dist folder

#### If you want to build it inside prepared environment, you can use Dockerfile

Note that dreambooth-spotty uses <code>nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04</code> base image.
To build xformers you will use <code>nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04</code> base image.

* Build docker image
  ```shell
    docker build -t xformers -f Dockerfile . 
  ```
* Run docker container
  ```shell
    docker run -it --gpus=all --rm xformers
  ```
* Build the wheel
  ```shell
    python setup.py bdist_wheel
  ```
* Get the wheel from dist folder

