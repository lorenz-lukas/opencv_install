FROM ubuntu:20.04

## BUILD BASIC PACKAGES
RUN apt update \
    && DEBIAN_FRONTEND="noninteractive" apt -y install tzdata \
    && apt install -y build-essential cmake pkg-config unzip yasm git checkinstall libjpeg-dev \
    libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libavresample-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libxvidcore-dev x264 libx264-dev \
    libfaac-dev libmp3lame-dev libtheora-dev libfaac-dev libmp3lame-dev libvorbis-dev \
    libopencore-amrnb-dev libopencore-amrwb-dev libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils 

WORKDIR /usr/include/linux

RUN ln -s -f ../libv4l1-videodev.h videodev.h

WORKDIR /

## BUILD OPENCV PYTHON PACKAGES
RUN apt-get install -y libgtk-3-dev python3-dev python3-pip python3-testresources

RUN pip3 install wheel numpy scipy matplotlib scikit-image scikit-learn \
    ipython dlib 

RUN git clone https://github.com/opencv/opencv.git \
    && git clone https://github.com/opencv/opencv_contrib.git

## BUILD C++ PACKAGES
RUN apt-get -y install libtbb-dev libatlas-base-dev gfortran \
    libprotobuf-dev protobuf-compiler libgoogle-glog-dev libgflags-dev \
    libgphoto2-dev libeigen3-dev libhdf5-dev doxygen 



WORKDIR /opencv/ 

RUN git checkout 4.5.1

WORKDIR /opencv_contrib/

RUN git checkout 4.5.1 \
    && mkdir -p /opencv/build

WORKDIR /opencv/build/

RUN ls /usr/bin

## BUILD OPENCV - CUDA OFF
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_C_COMPILER=/usr/bin/gcc-9 \
    -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=ON -D WITH_TBB=ON -D BUILD_opencv_cudacodec=OFF \
    -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=0 -D WITH_CUDA=OFF -D WITH_CUBLAS=0 \
    -D WITH_V4L=ON -D WITH_QT=OFF -D WITH_OPENGL=ON -D WITH_GSTREAMER=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_PC_FILE_NAME=opencv.pc -D OPENCV_ENABLE_NONFREE=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D PYTHON_EXECUTABLE=/usr/bin/python3.8\
    -D PYTHON3_INCLUDE_DIR=/usr/include/python3.8 \
    -D PYTHON3_LIBRARY=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu/libpython3.8.so \
    -D PYTHON3_NUMPY_INCLUDE_DIS=/usr/local/lib/python3.8/dist-packages/numpy/core/include \ 
    -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.8/dist-packages/ -D BUILD_EXAMPLES=ON ..

RUN make -j8 \
    && make install \
    && ldconfig 

WORKDIR /usr/local/include/

RUN ln -s opencv4/opencv2 \ 
    && mkdir -p /Projects/ 
