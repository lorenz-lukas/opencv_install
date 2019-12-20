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

# Install OPENCV:

git clone https://github.com/opencv/opencv.git

cd opencv

git checkout 4.2.0

cd ..


git clone https://github.com/opencv/opencv_contrib.git

cd opencv_contrib

git checkout 4.2.0

cd ..

mkdir ~/opencv/build/
cd ~/opencv/build/
