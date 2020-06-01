FROM osrf/ros:melodic-desktop-full

RUN apt update && apt install -y wget ros-melodic-video-stream-opencv
COPY yolo_entrypoint.sh /yolo_entrypoint.sh

# Build darknet ROS
WORKDIR /ros_ws
RUN mkdir src \
    && cd src \
    && git clone --recursive https://github.com/leggedrobotics/darknet_ros.git \
    && . /opt/ros/melodic/setup.sh \
    && cd .. \
    && catkin_make -DCMAKE_BUILD_TYPE=Release

ENTRYPOINT ["/yolo_entrypoint.sh"]
