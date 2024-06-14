# Use a base image
FROM ubuntu

# Set the working directory
WORKDIR /app

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y 

# Install necessary packages (fortune-mod, cowsay, netcat-openbsd)
RUN apt install fortune-mod cowsay netcat-openbsd -y

# Copy application files into the container
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Add /usr/games to the PATH environment variable
ENV PATH="/usr/games:${PATH}"

# Expose the application port
EXPOSE 4499

# Run the application 
CMD ["./wisecow.sh"]

