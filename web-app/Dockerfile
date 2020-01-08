############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Devin Wright


# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
 

# Install NGINX to test.
RUN apt-get install nginx -y
 

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy our default Nginx config
COPY ./default.conf /etc/nginx/conf.d/

# Copy our default Tomcat config
COPY ./tomcat-basic.conf /etc/nginx/conf.d/

# Copy domain information to sites available
COPY ./finmosis.com.conf /etc/nginx/sites-available

# Create symlink of this configuration in the sites-enabled folder
RUN ln -s /etc/nginx/sites-available/finmosis.com.conf /etc/nginx/sites-enabled/finmosis.com.conf

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["service nginx start", "-g", "daemon off;"]
