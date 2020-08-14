# opencv_install
Opencv install guide C++ python


# Install nividia drivers:

sudo add-apt-repository ppa:graphics-drivers/ppa

sudo apt update

softwares&updates -> additiona; drivers -> clicar no driver e instalar

# Install CUDA

sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb

sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub	

sudo apt-get update

sudo apt-get install cuda -y

- [nvida-CUDA](https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64)

# Install CUDA ubuntu 20.04

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin

sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb

sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub

sudo apt-get update

sudo apt-get -y install cuda

- [CUDA](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=2004&target_type=deblocal)

# Install CDNN V7.1.4

tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz cuda/

sudo cp cuda/include/cudnn.h /usr/local/cuda/include

sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64

sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*	

ln -s /usr/local/cuda-9.0/lib64/libcudnn.so.7

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
	
  - sudo add-apt-repository ppa:gnome3-team/gnome3-staging
  
  - sudo add-apt-repository ppa:gnome3-team/gnome3
  
  - sudo apt update
  
  - sudo apt dist-upgrade

sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install python3-dev

sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

 - PYTHON3
 
sudo apt -y install python3-dev python3-pip

sudo -H pip3 install -U pip numpy

sudo apt -y install python3-testresources

pip3 install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib

# Install OPENCV:

git clone https://github.com/opencv/opencv.git

cd opencv

git checkout 4.1.2

cd ..


git clone https://github.com/opencv/opencv_contrib.git

cd opencv_contrib

git checkout 4.1.2

cd ..

- Python2


mkdir ~/opencv/build/ && cd ~/opencv/build/

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D PYTHON2_EXECUTABLE=/usr/bin/python2.7 -D PYTHON2_INCLUDE_DIR=/usr/include/python2.7/ -D PYTHON2_LIBRARY=/usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so  -D PYTHON2_NUMPY_INCLUDE_DIS=/usr/lib/python2.7/dist-packages/numpy/core/include/ -D PYTHON2_PACKAGES_PATH=/usr/local/lib/python2.7/dist-packages/ -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLES=ON -D OPENCV_ENABLE_NONFREE=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON ..

- Python3.5

mkdir ~/opencv/build/ && cd ~/opencv/build/

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ -D PYTHON_EXECUTABLE=/usr/bin/python3.5 -D PYTHON3_INCLUDE_DIR=/usr/include/python3.5 -D PYTHON3_LIBRARY=/usr/lib/python3/config-x86_64-linux-gnu/libpython3.5.so -D PYTHON3_NUMPY_INCLUDE_DIS=/usr/local/lib/python3.5/dist-packages/numpy/core/include -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.5/dist-packages/ -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_OPENGL=ON -D BUILD_EXAMPLES=ON ..

make -j8

sudo make install

sudo ldconfig

- If the ld does not work correctly:

cd /usr/local/include/

sudo ln -s opencv4/opencv2

cd

# Instal TensorFlow2 - python3

pip install --upgrade pip

sudo pip install tensorflow-gpu


# TensorFlow with venv

- Virtual enviroment:
	
 sudo apt-get install python-pip python-dev python-virtualenv -y
	
 sudo pip install -U pip
	
 mkdir ~/Projects/tensorflow  
	
 cd ~/Projects/tensorflow
	
 virtualenv --system-site-packages venv
	
 source ~/Projects/tensorflow/venv/bin/activate 
	
 pip install -U pip
	
	ln -s /usr/local/cuda-9.0/targets/x86_64-linux/lib/lib.so.7
 
 sudo apt install nvidia-cuda-toolkit

- Tensorflow with gpu suport:
pip install -U tensorflow-gpu

source ~/Projects/tensorflow/venv/bin/activate 

- Tensorflow without gpu suport:
	pip install -U tensorflow

<<<ACTIVATE/DEACTIVATE VIRTUAL ENV>>>

source ~/Projects/tensorflow/venv/bin/activate 
deactivate venv

# ROS

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update

sudo apt-get install ros-kinetic-desktop-full

sudo rosdep init

rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

source ~/.bashrc

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential


# References:

https://linuxize.com/post/how-to-install-opencv-on-ubuntu-20-04/
