#!/bin/bash

# Exit on any error
set -e

# Set locale
echo "Setting locale..."
locale  # Check for UTF-8 support
apt update && apt install -y locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # Verify settings

# Setup Sources
echo "Setting up ROS 2 sources..."

# Ensure Ubuntu Universe repository is enabled
apt install -y software-properties-common
add-apt-repository universe

# Add the ROS 2 GPG key
apt update 
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add the repository to your sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 packages
echo "Installing ROS 2 packages..."
apt update
apt upgrade -y

# Install Desktop version (recommended)
apt install -y ros-humble-desktop

# Development tools
apt install -y ros-dev-tools

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Environment setup
echo "Setting up environment..."
source /opt/ros/humble/setup.bash

echo "ROS 2 installation complete."
