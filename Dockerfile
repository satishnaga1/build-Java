#use stable python image
FROM registry.access.redhat.com/ubi8/ubi
# Add any needed tools or dependencies here
RUN dnf install -y python3 python3-pip && dnf

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . . 

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

#Expose the port
#EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]
