# Create Opencv 4.5.1 DOCKER with C++11 and Python3.8.5

sudo docker build - < Dockerfile --label opencv4 --tag opencv4.5.1

# RUN opencv in container

 - device: mapping device from outside of the container;
 - v: mapping volume - folder to container;
 - e: enviroment variable;
 - p: port to comunicate
 - w: workdir

sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/findFaces:/Projects -v /tmp/.X11-unix:/tmp/.X11-unix --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --name=opencv4.5.1 opencv4:latest 

<!-- sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/findFaces:/Projects -v /tmp/.X11-unix:/tmp/.X11-unix --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --name=opencv4.5.1 opencv4:latest 


sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/findFaces:/Projects -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --security-opt label=disable --name=opencv4 opencv4:latest  -->

sudo docker start -i opencv4.5.1

sudo docker cp ~/Projects/opencv_install/TEST/. 156d92c3bd52:/Projects

# Install nividia drivers:

sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt update

softwares&updates -> additiona; drivers -> clicar no driver e instalar

# Carla Simulator (ANY UBUNTU)

DOWNLOAD FROM https://github.com/carla-simulator/carla/releases/tag/0.9.9

RUN ./CarlaUE4.sh

# OPENCV UBUNTU 20.04

-> CUDA 10.1.2:

	sudo apt install nvidia-cuda-toolkit

-> cdnn 7.6.5:

	[DOWNLOAD](https://developer.nvidia.com/compute/machine-learning/cudnn/secure/8.0.5/11.1_20201106/cudnn-11.1-linux-x64-v8.0.5.39.tgz)
	
	[REFERENCE](https://developer.nvidia.com/rdp/cudnn-archive)
	
	tar -xvzf cudnn-10.1-linux-x64-v7.6.5.32.tgz
	
	sudo cp cuda/include/cudnn.h /usr/lib/cuda/include/
	
	sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
	
	sudo chmod a+r /usr/lib/cuda/include/cudnn.h /usr/lib/cuda/lib64/libcudnn*
	
	echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
	
	echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc
	
	source ~/.bashrc

-> After extracting:

	sudo cp cuda/include/* /usr/lib/cuda/include/

	sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
	
	sudo chmod a+r /usr/lib/cuda/include/cudnn.h /usr/lib/cuda/lib64/libcudnn*
	
	
   Once you finish, you have to add the CUDA path to your ~/.bashrc file. Open ~/.bashrc and add following lines:

	echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
	
	echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc

	source ~/.bashrc
	
-> opencv

sudo apt update

sudo apt upgrade
		
sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall

sudo apt install libjpeg-dev libpng-dev libtiff-dev

sudo apt install libavcodec-dev libavformat-dev libswscale-dev libavresample-dev 

sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 

sudo apt install libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev  

sudo apt install libfaac-dev libmp3lame-dev libvorbis-dev

sudo apt install libopencore-amrnb-dev libopencore-amrwb-dev

sudo apt-get install libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils 

	cd /usr/include/linux 

	sudo ln -s -f ../libv4l1-videodev.h videodev.h 

	cd ~

sudo apt-get install libgtk-3-dev

sudo apt-get install python3-dev python3-pip 

sudo -H pip3 install -U pip numpy 

sudo apt install python3-testresources

pip3 install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib

sudo apt-get install libtbb-dev

sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install libprotobuf-dev protobuf-compiler 

sudo apt-get install libgoogle-glog-dev libgflags-dev 

sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

-> Cloning repos

git clone https://github.com/opencv/opencv.git

git clone https://github.com/opencv/opencv_contrib.git

cd opencv && git checkout 4.3.0 && cd ..

cd opencv_contrib && git checkout 4.3.0 && cd ..

mkdir -p opencv/build && cd opencv/build

-> building OPENCV

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_C_COMPILER=/usr/bin/gcc-8 -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=ON -D WITH_TBB=ON -D BUILD_opencv_cudacodec=OFF -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUDA=ON -D WITH_CUBLAS=1 -D WITH_V4L=ON -D WITH_QT=OFF -D WITH_OPENGL=ON -D WITH_GSTREAMER=ON -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_PC_FILE_NAME=opencv.pc -D OPENCV_ENABLE_NONFREE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D PYTHON_EXECUTABLE=/usr/bin/python3.8 -D PYTHON3_INCLUDE_DIR=/usr/include/python3.8 -D PYTHON3_LIBRARY=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu/libpython3.8.so -D PYTHON3_NUMPY_INCLUDE_DIS=/usr/local/lib/python3.8/dist-packages/numpy/core/include -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.8/dist-packages/ -D BUILD_EXAMPLES=ON .. 

(IT does not work for me...)
-D WITH_CUDNN=ON -D OPENCV_DNN_CUDA=ON -D CUDA_ARCH_BIN=7.5 -D WITH_CUDNN=ON -D OPENCV_DNN_CUDA=ON -D CUDA_ARCH_BIN=7.5 -D CUDNN_LIBRARY=/usr/local/cuda/lib64/libcudnn.so.7.6.5 -D CUDNN_INCLUDE_DIR=/usr/local/cuda/include .. 

make -j8

sudo make install

sudo ldconfig

    If the ld does not work correctly:

cd /usr/local/include/

sudo ln -s opencv4/opencv2

cd

# TENSORFLOW UBUNTU 20.04

pip install tensorflow

# INSTALL OPENCV ONLY PYTHON3:

- Dependencies:

sudo apt -y install python3-dev python3-pip

sudo -H pip3 install --upgrade pip

sudo -H pip3 install -U pip numpy

sudo apt -y install python3-testresources

pip3 install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib

sudo apt-get install libgtk-3-dev

sudo apt-get install python3-dev python3-pip

sudo -H pip3 install -U pip numpy

sudo apt install python3-testresources

pip3 install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib

sudo apt-get install libtbb-dev

sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install libprotobuf-dev protobuf-compiler

sudo apt-get install libgoogle-glog-dev libgflags-dev

sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen


- Packages:

pip3 install opencv-python

pip3 install opencv-python-contrib

# References:

https://linuxize.com/post/how-to-install-opencv-on-ubuntu-20-04/

https://www.tensorflow.org/install/pip?hl=pt-br

https://carla.readthedocs.io/en/stable/getting_started/

https://medium.com/@sb.jaduniv/how-to-install-opencv-4-2-0-with-cuda-10-1-on-ubuntu-20-04-lts-focal-fossa-bdc034109df3
