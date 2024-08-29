FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

SHELL [ "/bin/bash", "-c" ]

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Download and run ROS 2 setup script
RUN curl -OL https://raw.githubusercontent.com/nandu-k01/scripts/main/setup_humble.sh && \
    chmod +x setup_humble.sh && \
    ./setup_humble.sh

# Download and run robotic arm environment setup script
RUN source /opt/ros/humble/setup.bash && \
    cd ~/ && \
    curl -OL https://raw.githubusercontent.com/nandu-k01/robotic_arm_environment/main/robotic_arm_setup.sh && \
    chmod +x robotic_arm_setup.sh && \
    ./robotic_arm_setup.sh

# Install PyTorch and TensorBoard
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124 && \
    pip install tensorboard

# Source ROS 2 and workspace setup scripts in bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
    echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

RUN echo "All Done"
