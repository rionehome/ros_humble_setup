#!/bin/sh

# This script will install ROS 2 humble to your Ubuntu machine.
# Instructions follow the steps of the website below.
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
# Note that only Ubuntu 22.04 (Jammy) is acceptable

# make sure to run only on jammy
UBUNTU_VER="$(lsb_release -sc)"
[ "$UBUNTU_VER" = "jammy" ] || exit 1

# update packages
sudo apt update -y
sudo apt upgrade -y

# enable universe repository
sudo apt install -y software-properties-common
sudo add-apt-repository -y universe

# get key
sudo apt install -y curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# add sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# install ros2 packages
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y ros-humble-desktop
sudo apt install -y ros-dev-tools

grep -F "source /opt/ros/humble/setup.bash" ~/.bashrc ||
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

printf "
Installation is done!
Try this example to make sure it works.

Open another terminal and run the following commands
\$ ros2 run demo_nodes_cpp talker

Open another terminal and run
\$ ros2 run demo_nodes_py listener

You should see talker saying Publishing messages and listener saying I heard those messages.
If you can see it, it verifies you have both C++ and Python APIs are working properly.\n"
