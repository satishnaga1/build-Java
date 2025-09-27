# Use stable UBI8 base image
FROM registry.access.redhat.com/ubi8/ubi

# Install Python 3 and pip
RUN dnf install -y python3 python3-pip && \
    dnf clean all

# Set working directory
WORKDIR /app

# Copy local files to the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port (uncomment if needed)
# EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
