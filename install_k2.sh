#!/usr/bin/env bash

# Common steps
# conda create -n k2 python=3.8
# conda activate k2 
# conda install -c nvidia cudnn=7.6.5 cudatoolkit=10.2
# conda install -c pytorch pytorch
# pip install cmake
mkdir build
pushd build 

cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CUDA_COMPILER=$(which nvcc) \
  -DPYTHON_EXECUTABLE=$(which python) \
  -DCUDNN_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/libcudnn.so \
  -DCUDNN_INCLUDE_PATH=/usr/include/ \
  ..
  
make -j16 _k2

popd

# When updating and rebuilding K2, before executing these steps, run:
# rm -rf dist/
scripts/build_pip.sh
pip install dist/*
