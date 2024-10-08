# ROS 2 Humble Setup with Docker

This repository contains the necessary setup scripts and Docker configuration for setting up a ROS 2 Humble environment, along with a setup script for a manipulator. Follow the instructions below to get started.

## Table of Contents

- [Dockerfile](#dockerfile)
- [ROS 2 Humble Setup Script](#ros2-humble-script)
- [Manipulator Setup Script](#manipulator-setup-script)

## Dockerfile

This Dockerfile sets up a ROS 2 Humble environment with CUDA support. You can build and run the Docker container using the following commands:

### Download the Docker file

```bash

curl -OL https://raw.githubusercontent.com/nandu-k01/scripts/main/Dockerfile
```

### Build the Docker image

```bash
docker build -t cuda_enabled_ros .

```

### Run docker container

```bash
docker run --gpus all -it --name ros2_cuda -e DISPLAY=host.docker.internal:0.0 cuda_enabled_ros
```

## ROS2 humble Script

This script will install ros2 humble in your system.

### Download the script

```bash

curl -OL https://raw.githubusercontent.com/nandu-k01/scripts/main/setup_humble.sh
```

### Run the script

```bash
chmod +x setup_humble.sh
./setup_humble.sh

```

## Manipulator setup script

This script will create a ros2 workspace of the doosan_arm manipulator from here https://github.com/nandu-k01/robotic_arm_environment

### Download the setup script

```bash
curl -OL https://raw.githubusercontent.com/nandu-k01/robotic_arm_environment/main/robotic_arm_setup.sh
```

### Run the setup script

```bash

chmod +x robotic_arm_setup.sh
./robotic_arm_setup.sh

```

