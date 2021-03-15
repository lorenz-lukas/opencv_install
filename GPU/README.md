### Create Opencv 4.5.1 DOCKER with C++11 and Python3.8.5

# NVIDIA DOCKER SETUP:

	curl https://get.docker.com | sh \
	  && sudo systemctl --now enable docker

	distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
	   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
	   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
	   sudo tee /etc/apt/sources.list.d/nvidia-docker.list

	curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

	sudo apt-get update

	sudo apt-get install -y nvidia-docker2

	sudo systemctl restart docker

	sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi -lms

# Install nividia drivers:

	sudo add-apt-repository ppa:graphics-drivers/ppa

	sudo apt update

	softwares&updates -> additiona; drivers -> clicar no driver e instalar

# Build docker

	sudo docker build . --label opencv-gpu --tag opencv4.5.1

# RUN opencv in container

 - device: mapping device from outside of the container;
 - v: mapping volume - folder to container;
 - e: enviroment variable;
 - p: port to comunicate
 - w: workdir

	sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/TEST/:/Projects/ -v /tmp/.X11-unix:/tmp/.X11-unix --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 --gpus all -w /Projects -it --entrypoint=/bin/bash --name=opencv-gpu opencv4.5.1:latest

	sudo docker start -i opencv4.5.1

	sudo docker cp ~/Projects/opencv_install/TEST/. 156d92c3bd52:/Projects
