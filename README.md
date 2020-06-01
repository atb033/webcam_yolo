# webcam_yolo

This repository contains a dockerized, ROS implementation of YOLO

## Usage

### To build the docker image

- Goto `webcam_yolo` repository
- Build docker image

```Dockerfile
docker build -f Dockerfile -t webcam_yolo
```

### To run the docker container

```Dockerfile
docker run -it --rm --net host --privileged \
--workdir /ros_ws \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-e DISPLAY=$DISPLAY \
osrf/ros:melodic-desktop-full
```

### 

- publish image as rostopic

```
roslaunch video_stream_opencv camera.launch video_stream_provider:=0 &
```

- run darknet

```
roslaunch darknet_ros darknet_ros.launch image:=/camera/image_raw
```
