FROM ros:kinetic-perception

RUN apt-get update && apt-get install -y python-pip && pip install numpy progress

WORKDIR /root/catkin_ws
RUN mkdir -p /root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_init_workspace /root/catkin_ws/src'

COPY . /root/catkin_ws/src/lidar_bev/ 
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /root/catkin_ws; catkin_make'

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["/bin/bash"]

