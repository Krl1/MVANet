# Use the PyTorch image as the base image
FROM pytorch/pytorch:2.5.1-cuda12.1-cudnn9-devel

# Set environment variables for CUDA
ENV PATH="/usr/local/cuda/bin:$PATH" \
    CUDA_HOME="/usr/local/cuda" \
    LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Set the working directory inside the container
WORKDIR /workspace/MVANet

# Update the package list, install required system libraries, and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    libglib2.0-0 \
    libgl1-mesa-glx \
    net-tools \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install -U openmim && \
    mim install mmcv-full

# Copy and install additional Python requirements
COPY requirements.txt /workspace/MVANet/                                                    RUN pip install -r requirements.txt

RUN pip install mmdet==2.24.1 && \
    pip install mmcv==1.6.0

# Default command
CMD ["bash"]
