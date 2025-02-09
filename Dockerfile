# Use the rocker/rstudio base image
FROM rocker/rstudio:4.4.2

# Set environment variables if necessary
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    && apt-get clean

# Install an R package (e.g., cowsay)
RUN R -e "install.packages('cowsay', repos='https://cran.rstudio.com/')"

# Optional: Copy local files into the container
# COPY . /path/in/container

# Set the default working directory
WORKDIR /home/rstudio

# Expose RStudio port
EXPOSE 8787

# Command to run RStudio server (optional)
CMD ["rserver"]
