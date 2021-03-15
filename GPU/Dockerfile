#FROM nvidia/cuda:11.1-devel-ubuntu20.04
#FROM ubuntu:20.04
# FROM tensorflow/tensorflow:devel-gpu
FROM nvidia/cuda:11.0.3-cudnn8-runtime-ubuntu20.04

ARG OPENCV_VERSION=4.5.1
ARG CUDNN_INCLUDE_FILE=nvidia-cudnn8.0.5/*

COPY ${CUDNN_TAR_FILE} /usr/lib/cuda/include/

##BUILD BASIC PACKAGES
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install --no-install-recommends --yes --fix-missing tzdata \
    && apt-get install --no-install-recommends --yes --fix-missing \
    apt-utils build-essential cmake pkg-config unzip yasm git checkinstall libjpeg-dev \
    libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libavresample-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxvidcore-dev x264 libx264-dev \
    libfaac-dev libmp3lame-dev libtheora-dev libfaac-dev libmp3lame-dev libvorbis-dev \
    libopencore-amrnb-dev libopencore-amrwb-dev libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils \
    nvidia-cuda-toolkit python3-tk wget\
    && apt-get clean && rm -rf /tmp/* /var/tmp/* \
    && chmod a+r /usr/lib/cuda/include/cudnn.h \
    && echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc \
	&& echo 'export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}' >> ~/.bashrc \
    && source ~/.bashrc

WORKDIR /usr/include/linux

RUN ln -s -f ../libv4l1-videodev.h videodev.h

WORKDIR /

## BUILD OPENCV PYTHON AND C++ PACKAGES
RUN apt-get install --no-install-recommends --yes --fix-missing libgtk-3-dev \
    python3-dev python3-pip python3-testresources libcanberra-gtk-module \
    libcanberra-gtk3-module libtbb-dev libatlas-base-dev gfortran \
    libprotobuf-dev protobuf-compiler libgoogle-glog-dev libgflags-dev \
    libgphoto2-dev libeigen3-dev libhdf5-dev doxygen libboost-all-dev libpthread-stubs0-dev\
    && apt-get clean && rm -rf /tmp/* /var/tmp/*  

## It does not work if you separate dlib and tensorflow from the other packages
## If you do not install tensorflow or dlib, remember to install numpy and wheel
RUN pip3 install tensorflow dlib face-recognition imutils scipy matplotlib scikit-image scikit-learn 

RUN git clone https://github.com/opencv/opencv.git \
    && git clone https://github.com/opencv/opencv_contrib.git

## SET OPENCV VERSION
WORKDIR /opencv/ 

RUN git checkout $OPENCV_VERSION

WORKDIR /opencv_contrib/

RUN git checkout $OPENCV_VERSION \
    && mkdir -p /opencv/build

WORKDIR /opencv/build/

## BUILD OPENCV - CUDA OFF
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_C_COMPILER=/usr/bin/gcc-9 \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=ON \
    -D WITH_TBB=ON \ 
    -D WITH_CUDA=ON \
    -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-11.0/ \
    -D WITH_CUDNN=ON \
    -D OPENCV_DNN_CUDA=ON \
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D CUDA_ARCH_BIN=7.5 \
    -D WITH_CUBLAS=1 \
    -D CUDNN_INCLUDE_DIR=/usr/lib/cuda/include/nvidia-cudnn8.0.5/include/ \
    -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.8.0.5 \
    -D CUDNN_VERSION=8.0.5 \
    -D WITH_V4L=ON \
    -D WITH_QT=OFF \
    -D WITH_OPENGL=ON \
    -D WITH_GSTREAMER=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_PC_FILE_NAME=opencv.pc \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
    -D PYTHON_EXECUTABLE=/usr/bin/python3.8 \
    -D PYTHON3_INCLUDE_DIR=/usr/include/python3.8 \
    -D PYTHON3_LIBRARY=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu/libpython3.8.so \
    -D PYTHON3_NUMPY_INCLUDE_DIS=/usr/local/lib/python3.8/dist-packages/numpy/core/include \
    -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.8/dist-packages/ \
    -D BUILD_EXAMPLES=ON ..

RUN make -j8 \
    && make install \
    && ldconfig 

WORKDIR /usr/local/include/

RUN ln -s opencv4/opencv2 \ 
    && mkdir -p /Projects/ 

# SET USER
RUN groupadd -g 1000 opencv && useradd -u 1000 -g opencv -s /bin/bash opencv

USER opencv
