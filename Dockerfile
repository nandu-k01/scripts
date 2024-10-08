FROM nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \ 
    apt-get install tzdata

# Configure timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Update and install necessary packages
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*



# Download and run ROS 2 setup script
RUN curl -OL https://raw.githubusercontent.com/nandu-k01/scripts/main/setup_humble.sh && \
    chmod +x setup_humble.sh && \
    ./setup_humble.sh

# Install PyTorch and TensorBoard
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124 && \
    pip install tensorboard

# Create a workspace    
RUN mkdir -p ~/ros2_ws/src && cd ~/ros2_ws && colcon build --symlink-instal

# Source ROS 2 and workspace setup scripts in bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
    echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

# Final message
RUN echo "All Done"
