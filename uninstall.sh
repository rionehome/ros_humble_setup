#!/bin/sh

# remove packages
sudo apt remove -y ros-humble-* && sudo apt autoremove -y

# remove repository
sudo rm /etc/apt/sources.list.d/ros2.list
sudo apt update
sudo apt autoremove -y
sudo apt upgrade -y
