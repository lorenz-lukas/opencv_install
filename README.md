# opencv_install
Opencv install guide C++ python


# Install nividia drivers:

sudo add-apt-repository -y ppa:xorg-edgers/ppa

sudo apt-get update

sudo apt-get install nvidia-346 nvidia-settings

# Install CUDA

sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb

sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub	

sudo apt-get update

sudo apt-get install cuda -y

- [nvida-CUDA](https://developer.nvidia.com/cuda90downloadarchivetarget_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal)

# Install CDNN

tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz

sudo cp cuda/include/cudnn.h /usr/local/cuda/include

sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64

sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*	

ln -s /usr/local/cuda-9.0/targets/x86_64-linux/lib/libcudnn.so.7

sudo apt install nvidia-cuda-toolkit -y

- [nvida-CDNN](https://developer.nvidia.com/rdp/cudnn-archive)

# Install OPENCV dependencies:
sudo apt-get update

sudo apt-get upgrade

sudo apt-get install build-essential cmake unzip pkg-config

sudo apt-get install libjpeg-dev libpng-dev libtiff-dev

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

sudo apt-get install libxvidcore-dev libx264-dev

sudo apt-get install libgtk-3-dev

sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install python3-dev

sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

 - PYTHON3
 
sudo apt -y install python3-dev python3-pip

sudo -H pip3 install -U pip numpy

sudo apt -y install python3-testresources

# Install OPENCV:

git clone https://github.com/opencv/opencv.git

cd opencv

git checkout 4.1.2

cd ..


git clone https://github.com/opencv/opencv_contrib.git

cd opencv_contrib

git checkout 4.1.2

cd ..

mkdir ~/opencv/build/ && cd ~/opencv/build/

- Python2

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D PYTHON2_EXECUTABLE=/usr/bin/python2.7 -D PYTHON2_INCLUDE_DIR=/usr/include/python2.7/ -D PYTHON2_LIBRARY=/usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so  -D PYTHON2_NUMPY_INCLUDE_DIS=/usr/lib/python2.7/dist-packages/numpy/core/include/ -D PYTHON2_PACKAGES_PATH=/usr/local/lib/python2.7/dist-packages/ -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLES=ON -D OPENCV_ENABLE_NONFREE=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON ..

- Python3

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_ENABLE_NONFREE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-4.1.2-py3/lib/python3.5/site-packages -D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-4.1.2-py3/lib/python3.5/site-packages -D WITH_V4L=ON -D WITH_OPENGL=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON ..

make -j8

sudo make install

sudo ldconfig

- If the ld does not work correctly:

cd /usr/local/include/

sudo ln -s opencv4/opencv2

cd

# Instal TensorFlow

pip install --upgrade pip

pip install tensorflow-gpu
