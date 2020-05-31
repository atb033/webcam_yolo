FROM osrf/ros:melodic-desktop-full

RUN apt update && apt install -y wget ros-melodic-video-stream-opencv \
    && . /opt/ros/melodic/setup.sh
COPY darknet_ros /ros_ws/src/darknet_ros
COPY yolo_entrypoint.sh /yolo_entrypoint.sh

# Build darknet ROS
WORKDIR /ros_ws
RUN catkin_make -DCMAKE_BUILD_TYPE=Release

# Download weights
RUN wget http://pjreddie.com/media/files/yolov2.weights \
    && wget http://pjreddie.com/media/files/yolov2-tiny.weights \
    && wget http://pjreddie.com/media/files/yolov3-tiny.weights \
    && wget http://pjreddie.com/media/files/yolov3.weights

ENTRYPOINT ["/yolo_entrypoint.sh"]
