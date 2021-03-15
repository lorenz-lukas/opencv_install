# Create Opencv 4.5.1 DOCKER with C++11 and Python3.8.5

	sudo docker build - < Dockerfile --label opencv4 --tag opencv4.5.1

# RUN opencv in container

 - device: mapping device from outside of the container;
 - v: mapping volume - folder to container;
 - e: enviroment variable;
 - p: port to comunicate
 - w: workdir

sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/TEST/:/Projects/ -v /tmp/.X11-unix:/tmp/.X11-unix --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --name=opencv4.5.1 opencv4:latest 

sudo docker start -i opencv4.5.1

sudo docker cp ~/Projects/opencv_install/TEST/. 156d92c3bd52:/Projects


<!-- sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/findFaces:/Projects -v /tmp/.X11-unix:/tmp/.X11-unix --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --name=opencv4.5.1 opencv4:latest -->


<!-- sudo docker run --device=/dev/video0:/dev/video0 -v $(pwd)/TEST/:/Projects -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 5000:5000 -p 8888:8888 -w /Projects -it --entrypoint=/bin/bash --security-opt label=disable --name=opencv4 opencv4:latest  -->
