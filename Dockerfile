# Use stable UBI8 base image
FROM registry.access.redhat.com/ubi8/ubi

# Install Python 3, pip, and required build dependencies
RUN dnf install -y \
    python3 \
    python3-pip \
    python3-devel \
    gcc \
    gcc-c++ \
    make \
    redhat-rpm-config \
    openssl-devel \
    libffi-devel \
    && dnf clean all

# Set working directory
WORKDIR /app

# Copy local files to the container
COPY . .

# Install Python dependencies
RUN pip3 install --upgrade pip setuptools wheel
# RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port (optional)
# EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
